defmodule EpiChat.Api do
  @moduledoc """
  The Api context.
  """

  import Ecto.Query, warn: false
  alias EpiChat.Repo

  alias EpiChat.Api.Protected

  @doc """
  Returns the list of protecteds.

  ## Examples

      iex> list_protecteds()
      [%Protected{}, ...]

  """
  def list_protecteds do
    Repo.all(Protected)
  end

  @doc """
  Gets a single protected.

  Raises `Ecto.NoResultsError` if the Protected does not exist.

  ## Examples

      iex> get_protected!(123)
      %Protected{}

      iex> get_protected!(456)
      ** (Ecto.NoResultsError)

  """
  def get_protected!(id), do: Repo.get!(Protected, id)

  @doc """
  Creates a protected.

  ## Examples

      iex> create_protected(%{field: value})
      {:ok, %Protected{}}

      iex> create_protected(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_protected(attrs \\ %{}) do
    %Protected{}
    |> Protected.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a protected.

  ## Examples

      iex> update_protected(protected, %{field: new_value})
      {:ok, %Protected{}}

      iex> update_protected(protected, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_protected(%Protected{} = protected, attrs) do
    protected
    |> Protected.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a protected.

  ## Examples

      iex> delete_protected(protected)
      {:ok, %Protected{}}

      iex> delete_protected(protected)
      {:error, %Ecto.Changeset{}}

  """
  def delete_protected(%Protected{} = protected) do
    Repo.delete(protected)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking protected changes.

  ## Examples

      iex> change_protected(protected)
      %Ecto.Changeset{data: %Protected{}}

  """
  def change_protected(%Protected{} = protected, attrs \\ %{}) do
    Protected.changeset(protected, attrs)
  end
end
