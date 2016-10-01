defmodule MegaMerchant.PageController do
  use MegaMerchant.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
