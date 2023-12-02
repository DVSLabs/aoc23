defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&line_calibration_value/1)
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&first_and_last_number/1)
    |> Enum.sum()
  end

  defp first_and_last_number(string) do
    number_regex = ~r/(?=(one|two|three|four|five|six|seven|eight|nine|[0-9]))/

    matches = Regex.scan(number_regex, string)
    [_, first] = List.first(matches)
    [_, last] = List.last(matches)

    number_list_to_number([first, last])
  end

  defp number_list_to_number(list) do
    list
    |> Enum.map(&words_to_numbers/1)
    |> List.to_string()
    |> String.to_integer()
  end

  defp words_to_numbers(string) do
    numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    String.replace(string, numbers, fn x ->
      (Enum.find_index(numbers, &(&1 == x)) + 1)
      |> Integer.to_string()
    end)
  end

  # TODO: doesn't work if the string has no numbers
  defp line_calibration_value(string) do
    # remove any non-numeric characters
    number_from_string = String.replace(string, ~r/[^\d]/, "")

    calibration_number = [
      # first number
      String.at(number_from_string, 0),
      # last number, or first number is string has length of 1
      String.at(number_from_string, -1)
    ]

    calibration_number
    |> List.to_string()
    |> String.to_integer()
  end
end
