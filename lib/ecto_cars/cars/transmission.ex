defmodule EctoCars.Transmission do
  use Ecto.Schema
  import Ecto.Changeset, only: [cast: 3, validate_required: 2]

  schema "transmissions" do
    field :type, :string
  end

  def changeset(%__MODULE__{} = transmission, attrs \\ %{}) do
    transmission
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
