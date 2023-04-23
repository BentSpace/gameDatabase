defmodule GameDatabase.Repo.Migrations.CreatePrimaryOperatingSystems do
  use Ecto.Migration

  def change do
    create table(:primary_operating_systems) do
      add :name, :string
      add :maker, :string

      timestamps()
    end
  end
end
