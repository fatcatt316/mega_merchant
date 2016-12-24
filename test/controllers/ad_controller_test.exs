defmodule MegaMerchant.AdControllerTest do
  use MegaMerchant.ConnCase

  alias MegaMerchant.Ad
  @valid_attrs %{description: "some content", price: "120.5", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, ad_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ads"
  end

  # test "renders form for new resources", %{conn: conn} do
  #   conn = get conn, ad_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New ad"
  # end

  # test "creates resource and redirects when data is valid", %{conn: conn} do
  #   conn = post conn, ad_path(conn, :create), ad: @valid_attrs
  #   assert redirected_to(conn) == ad_path(conn, :index)
  #   assert Repo.get_by(Ad, @valid_attrs)
  # end

  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, ad_path(conn, :create), ad: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New ad"
  # end

  test "shows chosen resource", %{conn: conn} do
    ad = Repo.insert! %Ad{}
    conn = get conn, ad_path(conn, :show, ad)
    assert html_response(conn, 200) =~ "Show ad"
  end

  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, ad_path(conn, :show, -1)
  #   end
  # end

  # test "renders form for editing chosen resource", %{conn: conn} do
  #   ad = Repo.insert! %Ad{}
  #   conn = get conn, ad_path(conn, :edit, ad)
  #   assert html_response(conn, 200) =~ "Edit ad"
  # end

  # test "updates chosen resource and redirects when data is valid", %{conn: conn} do
  #   ad = Repo.insert! %Ad{}
  #   conn = put conn, ad_path(conn, :update, ad), ad: @valid_attrs
  #   assert redirected_to(conn) == ad_path(conn, :show, ad)
  #   assert Repo.get_by(Ad, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   ad = Repo.insert! %Ad{}
  #   conn = put conn, ad_path(conn, :update, ad), ad: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit ad"
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   ad = Repo.insert! %Ad{}
  #   conn = delete conn, ad_path(conn, :delete, ad)
  #   assert redirected_to(conn) == ad_path(conn, :index)
  #   refute Repo.get(Ad, ad.id)
  # end
end
