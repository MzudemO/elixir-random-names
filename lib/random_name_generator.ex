defmodule RandomNameGenerator do
  @moduledoc """
  Generates random names in a gfycat format
  """

  def random_name(), do: random_name(2, 1, "_", :lowercase)

  def random_name(num_adjectives, num_animals, separator, casing \\ :capitalize) do
    %{adjectives: adjectives, animals: animals} = read_lists()
    random_adjectives = take_random(adjectives, num_adjectives, separator, casing)
    random_animals = take_random(animals, num_animals, separator, casing)

    [random_adjectives, random_animals]
    |> Enum.filter(fn v -> v != "" end)
    |> Enum.join(separator)
  end

  defp read_lists() do
    with {:ok, adjectives} <- File.read("lib/data/adjectives.txt"),
         adjectives <- String.split(adjectives),
         {:ok, animals} <- File.read("lib/data/animals.txt"),
         animals <- String.split(animals) do
      %{adjectives: adjectives, animals: animals}
    end
  end

  defp take_random(list, count, separator, casing) do
    list
    |> Enum.take_random(count)
    |> casing(casing)
    |> Enum.join(separator)
  end

  defp casing(list, :capitalize) do
    Enum.map(list, &String.capitalize/1)
  end

  defp casing(list, :lowercase), do: list
end
