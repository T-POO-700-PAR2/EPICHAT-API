defmodule EpiChat.ApiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EpiChat.Api` context.
  """

  @doc """
  Generate a protected.
  """
  def protected_fixture(attrs \\ %{}) do
    {:ok, protected} =
      attrs
      |> Enum.into(%{
        field1: "some field1",
        field2: 42
      })
      |> EpiChat.Api.create_protected()

    protected
  end
end
