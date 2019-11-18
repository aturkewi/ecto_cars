defmodule EctoCars.Car do
  use Ecto.Schema
  import Ecto.Changeset, only: [cast: 3, validate_required: 2]

  alias EctoCars.Specification

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
end
