defmodule EctoCars.Repo do
  use Ecto.Repo,
    otp_app: :ecto_cars,
    adapter: Ecto.Adapters.Postgres
end
