defmodule EpiChatWeb.ProtectedController do
  use EpiChatWeb, :controller

  alias EpiChat.Api
  alias EpiChat.Api.Protected

  action_fallback EpiChatWeb.FallbackController

  defp authenticate_user(conn) do
    case conn.assigns[:firebase_uid] do
      nil ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Authentication required"})
        |> halt()

      uid ->

        {:ok, uid}
    end
  end

  def index(conn, _params) do
    authenticate_user(conn)

    protecteds = Api.list_protecteds()
    render(conn, :index, protecteds: protecteds)
  end

  def create(conn, %{"protected" => protected_params}) do
    authenticate_user(conn)

    with {:ok, %Protected{} = protected} <- Api.create_protected(protected_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/protecteds/#{protected}")
      |> render(:show, protected: protected)
    end
  end

  def show(conn, %{"id" => id}) do
    authenticate_user(conn)

    protected = Api.get_protected!(id)
    render(conn, :show, protected: protected)
  end

  def update(conn, %{"id" => id, "protected" => protected_params}) do
    authenticate_user(conn)

    protected = Api.get_protected!(id)

    with {:ok, %Protected{} = protected} <- Api.update_protected(protected, protected_params) do
      render(conn, :show, protected: protected)
    end
  end

  def delete(conn, %{"id" => id}) do
    authenticate_user(conn)

    protected = Api.get_protected!(id)

    with {:ok, %Protected{}} <- Api.delete_protected(protected) do
      send_resp(conn, :no_content, "")
    end
  end
end
