defmodule EpiChatWeb.ProtectedJSON do
  alias EpiChat.Api.Protected

  @doc """
  Renders a list of protecteds.
  """
  def index(%{protecteds: protecteds}) do
    %{data: for(protected <- protecteds, do: data(protected))}
  end

  @doc """
  Renders a single protected.
  """
  def show(%{protected: protected}) do
    %{data: data(protected)}
  end

  defp data(%Protected{} = protected) do
    %{
      id: protected.id
    }
  end
end
