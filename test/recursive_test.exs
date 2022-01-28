defmodule RecursiveTest do
  use ExUnit.Case
  doctest Recursive

  test "greets the world" do
    assert Recursive.hello() == :world
  end
end
