defmodule AdventOfCode.Day01 do
  def part1(args) do
    number_regex = ~r/([0-9])/

    args
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&first_and_last_number(&1, number_regex))
    |> Enum.map(&number_list_to_integer/1)
    |> Enum.sum()
  end

  def part2(args) do
    number_regex = ~r/(?=(one|two|three|four|five|six|seven|eight|nine|[0-9]))/

    args
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&first_and_last_number(&1, number_regex))
    |> Enum.map(fn number -> Enum.map(number, &replace_word_with_number/1) end)
    |> Enum.map(&number_list_to_integer/1)
    |> Enum.sum()
  end

  defp first_and_last_number(string, regex) do
    matches = Regex.scan(regex, string)
    [_, first] = List.first(matches)
    [_, last] = List.last(matches)

    [first, last]
  end

  defp number_list_to_integer(list) do
    list
    |> List.to_string()
    |> String.to_integer()
  end

  defp replace_word_with_number(string) do
    numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    String.replace(string, numbers, fn x ->
      (Enum.find_index(numbers, &(&1 == x)) + 1)
      |> Integer.to_string()
    end)
  end
end
