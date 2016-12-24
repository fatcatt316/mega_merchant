defmodule MegaMerchant.Session do
  alias MegaMerchant.User

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate_by_password(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: MegaMerchant.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)

  defp authenticate_by_password(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end
end