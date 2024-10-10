defmodule EpiChat.Api.Protected do
  use Ecto.Schema
  import Ecto.Changeset

  schema "protecteds" do
    field :field1, :string
    field :field2, :integer

    timestamps()
  end

  @doc false
  def changeset(protected, attrs) do
    protected
    |> cast(attrs, [:field1, :field2])
    |> validate_required([:field1, :field2])
  end
end
