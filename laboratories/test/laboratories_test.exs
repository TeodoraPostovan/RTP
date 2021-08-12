defmodule LaboratoriesTest do
  use ExUnit.Case
  doctest Laboratories

  test "greets the world" do
    assert Laboratories.hello() == :world
  end
end
