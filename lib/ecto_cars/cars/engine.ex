defmodule EctoCars.Engine do
  use Ecto.Schema
  import Ecto.Changeset, only: [cast: 3, validate_required: 2]

  schema "engines" do
    field :name, :string
    field :cylinders, :integer
    field :horse_power, :integer
  end

  def changeset(%__MODULE__{} = engine, attrs \\ %{}) do
    engine
    |> cast(attrs, [:name, :cylinders, :horse_power])
    |> validate_required([:name, :cylinders, :horse_power])
  end
end
