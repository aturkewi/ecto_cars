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
    # 1. Big engine and automatic
    %{engine_id: 1, transmission_id: 1},
    # 2. Big engine and manula
    %{engine_id: 1, transmission_id: 2},
    # 3. Small engine and automatic
    %{engine_id: 2, transmission_id: 1},
    # 4. Small engine and manual
    %{engine_id: 2, transmission_id: 2}
  ]

  @cars_info [
    %{color: "blue", vin_number: "too_small", specification_id: 3},
    %{color: "red", vin_number: "wrong_color", specification_id: 1},
    %{color: "blue", vin_number: "my_dream_car", specification_id: 1},
    %{color: "blue", vin_number: "cant_drive_this", specification_id: 2},
    %{color: "green", vin_number: "nothing_i_want_here", specification_id: 4}
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
