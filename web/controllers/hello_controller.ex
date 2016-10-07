defmodule MegaMerchant.HelloController do
  use MegaMerchant.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"messenger" => messenger}) do # TODO: _params
    render conn, "show.html", messenger: messenger
  end
end
