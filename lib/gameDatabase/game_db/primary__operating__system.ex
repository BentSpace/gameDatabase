defmodule GameDatabase.GameDB.Primary_Operating_System do
  use Ecto.Schema
  import Ecto.Changeset

  schema "primary_operating_systems" do
    field :maker, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(primary__operating__system, attrs) do
    primary__operating__system
    |> cast(attrs, [:name, :maker])
    |> validate_required([:name, :maker])
  end
end
