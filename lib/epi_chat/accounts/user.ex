defmodule EpiChat.Accounts.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> Ecto.Changeset.cast(attrs, [:email, :name, :password])
    |> Ecto.Changeset.validate_required([:email, :name, :password])
    |> Ecto.Changeset.validate_length(:password, min: 6)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case Ecto.Changeset.get_change(changeset, :password) do
      nil -> changeset
      password -> Ecto.Changeset.put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
    end
  end
end
