defmodule EpiChatWeb.ProtectedControllerTest do
  use EpiChatWeb.ConnCase

  import EpiChat.ApiFixtures

  alias EpiChat.Api.Protected

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all protecteds", %{conn: conn} do
      conn = get(conn, ~p"/api/protecteds")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create protected" do
    test "renders protected when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/protecteds", protected: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/protecteds/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/protecteds", protected: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update protected" do
    setup [:create_protected]

    test "renders protected when data is valid", %{conn: conn, protected: %Protected{id: id} = protected} do
      conn = put(conn, ~p"/api/protecteds/#{protected}", protected: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/protecteds/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, protected: protected} do
      conn = put(conn, ~p"/api/protecteds/#{protected}", protected: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete protected" do
    setup [:create_protected]

    test "deletes chosen protected", %{conn: conn, protected: protected} do
      conn = delete(conn, ~p"/api/protecteds/#{protected}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/protecteds/#{protected}")
      end
    end
  end

  defp create_protected(_) do
    protected = protected_fixture()
    %{protected: protected}
  end
end
