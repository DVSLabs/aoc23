defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&line_calibration_value/1)
    |> Enum.sum()
  end

  def part2(_args) do
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
