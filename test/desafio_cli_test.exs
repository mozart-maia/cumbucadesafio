defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "greets the world" do
    assert DesafioCli.phrase() == "Hello, world!"
  end

  test "convert 1994 to MCMXCIV" do
    assert DesafioCli.number_to_roman(1994) == "MCMXCIV"
  end
end
