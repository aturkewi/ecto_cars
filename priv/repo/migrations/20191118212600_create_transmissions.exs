defmodule EctoCars.Repo.Migrations.CreateTransmissions do
  use Ecto.Migration

  def change do
    create table(:transmissions) do
      add :type, :string
    end
  end
end
