defmodule MegaMerchant.Plug.Authenticate do
  import Plug.Conn
  import MegaMerchant.Router.Helpers
  import Phoenix.Controller
  import MegaMerchant.Session

  def init(default), do: default

  def call(conn, _default) do
    if logged_in?(conn) do
      conn
    else
      conn
        |> put_flash(:error, 'You need to log in to do that.')
        |> redirect(to: session_path(conn, :new))
        |> halt()
    end
  end
end