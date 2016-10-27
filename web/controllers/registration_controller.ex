require IEx

defmodule MegaMerchant.RegistrationController do
  use MegaMerchant.Web, :controller
  alias MegaMerchant.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    # case Repo.insert(changeset) do
    case MegaMerchant.Registration.create(changeset, MegaMerchant.Repo) do
      {:ok, _user} ->
        # sign in the user
        conn
        |> put_flash(:info, "You done registered 👍")
        |> redirect(to: "/")
      {:error, changeset} ->
        # show error
        conn
        |> put_flash(:info, "Unable to create account :(")
        render(conn, "new.html", changeset: changeset)
    end
  end
end
