defmodule EctoCars.Repo.Migrations.CreateEngines do
  use Ecto.Migration

  def change do
    create table(:engines) do
      add :name, :string
      add :cylinders, :integer
      add :horse_power, :integer
    end
  end
end
