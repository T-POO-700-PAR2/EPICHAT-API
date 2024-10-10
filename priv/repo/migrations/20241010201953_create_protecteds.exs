defmodule EpiChat.Repo.Migrations.CreateProtecteds do
  use Ecto.Migration

  def change do
    create table(:protecteds) do
      add :field1, :string
      add :field2, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
