defmodule EctoCars.Car do
  use Ecto.Schema
  import Ecto.Changeset, only: [cast: 3, validate_required: 2]
  import Ecto.Query, only: [where: 3, join: 5]

  alias EctoCars.{Car, Specification, Transmission}

  schema "cars" do
    field(:color, :string)
    field(:vin_number, :string)

    belongs_to(:specification, Specification)
  end

  def changeset(%__MODULE__{} = car, attrs \\ %{}) do
    car
    |> cast(attrs, [:color, :vin_number, :specification_id])
    |> validate_required([:color, :vin_number, :specification_id])
  end

  def with_color(query \\ Car, color) do
    query
    |> where([c], c.color == ^color)
  end

  def with_transmission(query \\ Car, type) do
    query
    |> join(:left, [c], s in Specification, on: c.specification_id == s.id)
    |> join(:left, [c, s], t in Transmission, on: s.transmission_id == t.id)
    |> where([c, s, t], t.type == ^type)
  end
end
