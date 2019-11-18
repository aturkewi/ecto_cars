defmodule EctoCars.Repo.Migrations.CreateSpecifications do
  use Ecto.Migration

  def change do
    create table(:specifications) do
      add :transmission_id, references(:transmissions)
      add :engine_id, references(:engines)
    end
  end
end
