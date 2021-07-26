defmodule RandomNameGeneratorTest do
  use ExUnit.Case
  doctest RandomNameGenerator

  test "greets the world" do
    assert RandomNameGenerator.hello() == :world
  end
end
