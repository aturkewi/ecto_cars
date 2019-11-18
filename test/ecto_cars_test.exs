defmodule EctoCarsTest do
  use ExUnit.Case
  doctest EctoCars

  test "greets the world" do
    assert EctoCars.hello() == :world
  end
end
