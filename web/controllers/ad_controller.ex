require IEx
defmodule MegaMerchant.AdController do
  use MegaMerchant.Web, :controller

  plug MegaMerchant.Plug.Authenticate when action in [:new, :create, :edit, :update, :delete]

  alias MegaMerchant.Ad

  def index(conn, _params) do
    ads = Repo.all(Ad)
    render(conn, "index.html", ads: ads)
  end

  def new(conn, _params) do
    changeset = Ad.changeset(%Ad{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ad" => ad_params}) do
    # Set :user_id to current user's ID
    ad_user_params = Map.put(ad_params, "user_id", get_session(conn, :current_user))

    changeset = Ad.changeset(%Ad{}, ad_user_params)

    case Repo.insert(changeset) do
      {:ok, _ad} ->
        conn
        |> put_flash(:info, "Ad created successfully.")
        |> redirect(to: ad_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ad = Repo.get!(Ad, id) |> Repo.preload(:user)

    render(conn, "show.html", ad: ad)
  end

  def edit(conn, %{"id" => id}) do
    ad = load_authorized_ad(conn, id) # TODO: Plug (before_action)
    changeset = Ad.changeset(ad)
    render(conn, "edit.html", ad: ad, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ad" => ad_params}) do
    ad = load_authorized_ad(conn, id) # TODO: Plug (before_action)

    # TODO: Strong params - don't allow ID to change, or user_id
    # Set :user_id to current user's ID
    ad_user_params = Map.put(ad_params, "user_id", get_session(conn, :current_user))
    changeset = Ad.changeset(ad, ad_user_params)

    case Repo.update(changeset) do
      {:ok, ad} ->
        conn
        |> put_flash(:info, "Ad updated successfully.")
        |> redirect(to: ad_path(conn, :show, ad))
      {:error, changeset} ->
        render(conn, "edit.html", ad: ad, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ad = load_authorized_ad(conn, id) # TODO: Plug (before_action)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(ad)

    conn
    |> put_flash(:info, "Ad deleted successfully.")
    |> redirect(to: ad_path(conn, :index))
  end

  # TODO: Better way to scope query off current user?
  defp load_authorized_ad(conn, id) do
    # TODO: Allow admin user to load any Ad
    ad = Repo.get_by(Ad, id: id, user_id: get_session(conn, :current_user))

    if ad do
      ad
    else
      conn
      |> put_flash(:info, "Whoops, can't find that ad.")
      |> redirect(to: ad_path(conn, :index))
    end
  end
end
