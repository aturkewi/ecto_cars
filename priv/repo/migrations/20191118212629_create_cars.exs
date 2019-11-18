defmodule EctoCars.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :color, :string
      add :vin_number, :string
      add :specification_id, references(:specifications)
    end
  end
end
