defmodule MegaMerchant.RegistrationControllerTest do
  use MegaMerchant.ConnCase

  require IEx

  # alias MegaMerchant.Registration
  @valid_attrs %{email: "some@content.com", password: "That's word"}
  @invalid_attrs %{}

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, registration_path(conn, :new)
    assert html_response(conn, 200) =~ "Create an account"
  end

  # test "creates resource and redirects when data is valid", %{conn: conn} do
  #   conn = post conn, registration_path(conn, :create), user: @valid_attrs
  #   assert redirected_to(conn) == page_path(conn, :index)
  #   assert Repo.get_by(User, @valid_attrs)
  # end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), user: @invalid_attrs
    assert html_response(conn, 200) =~ "Create an account"
  end
end
