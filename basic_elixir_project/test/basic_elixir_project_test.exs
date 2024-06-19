defmodule BasicElixirProjectTest do
  use ExUnit.Case
  doctest BasicElixirProject

  test "greets the world" do
    assert BasicElixirProject.hello() == :world
  end
end
