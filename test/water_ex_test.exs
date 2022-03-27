defmodule WaterExTest do
  use ExUnit.Case
  doctest WaterEx

  test "greets the world" do
    assert WaterEx.hello() == :world
  end
end
