defmodule EctoCars.Specification do
  use Ecto.Schema
  import Ecto.Changeset, only: [cast: 3, validate_required: 2]

  alias EctoCars.{Engine, Transmission}

  schema "specifications" do
    belongs_to(:engine, Engine)
    belongs_to(:transmission, Transmission)
  end

  def changeset(%__MODULE__{} = specification, attrs \\ %{}) do
    specification
    |> cast(attrs, [:engine_id, :transmission_id])
    |> validate_required([:engine_id, :transmission_id])
  end
end
