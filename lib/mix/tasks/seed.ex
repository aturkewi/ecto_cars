defmodule Mix.Tasks.Seed do
  use Mix.Task

  alias EctoCars.{Car, Engine, Repo, Specification, Transmission}

  @engines_info [
    %{
      name: "Big Engine",
      cylinders: 8,
      horse_power: 250
    },
    %{
      name: "Small Engine",
      cylinders: 6,
      horse_power: 120
    }
  ]

  @transmissions_info [
    %{type: "automatic"},
    %{type: "manual"}
  ]

  @specifications_info [
    %{engine_id: 1, transmission_id: 1},
    %{engine_id: 1, transmission_id: 2},
    %{engine_id: 2, transmission_id: 1},
    %{engine_id: 2, transmission_id: 2}
  ]

  @cars_info [
    # blue automatic v8
    %{color: "blue", vin_number: "car1", specification_id: 1},
    %{color: "black", vin_number: "car2", specification_id: 2},
    %{color: "red", vin_number: "car3", specification_id: 2},
    %{color: "purple", vin_number: "car4", specification_id: 3},
    %{color: "blue", vin_number: "car5", specification_id: 4},
    %{color: "green", vin_number: "car6", specification_id: 4}
  ]

  @impl Mix.Task
  def run(_args) do
    seed_engines()
    seed_transmissions()
    seed_specifications()
    seed_cars()
  end

  def seed_engines do
    @engines_info
    |> Enum.each(fn engine_info ->
      case Repo.get_by(Engine, engine_info) do
        nil ->
          %Engine{}
          |> Engine.changeset(engine_info)
          |> Repo.insert()
        _ -> :ok
      end
    end)
  end

  def seed_transmissions do
    @transmissions_info
    |> Enum.each(fn transmission_info ->
      case Repo.get_by(Transmission, transmission_info) do
        nil ->
          %Transmission{}
          |> Transmission.changeset(transmission_info)
          |> Repo.insert()
        _ -> :ok
      end
    end)
  end

  def seed_specifications do
    @specifications_info
    |> Enum.each(fn specification_info ->
      case Repo.get_by(Specification, specification_info) do
        nil ->
          %Specification{}
          |> Specification.changeset(specification_info)
          |> Repo.insert()
        _ -> :ok
      end
    end)
  end

  def seed_cars do
    @cars_info
    |> Enum.each(fn car_info ->
      case Repo.get_by(Car, car_info) do
        nil ->
          %Car{}
          |> Car.changeset(car_info)
          |> Repo.insert()
        _ -> :ok
      end
    end)
  end
end
