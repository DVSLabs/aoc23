defmodule AdventOfCode.Day02 do
  def part1(game_record, constraint) do
    game_record
    |> split_games()
    |> reject_games(constraint)
    |> sum_game_ids()
  end

  def split_games(game_record) do
    split_by_game_regex = ~r/Game\s(?<game_id>\d*):\s(?<colours>.*)/
    cube_number_by_colour_regex = ~r/(\d+\s\w*)/

    game_record
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(fn game ->
      split_by_game = Regex.named_captures(split_by_game_regex, game)

      cube_number_by_colour =
        Regex.scan(cube_number_by_colour_regex, split_by_game["colours"])

      ["#{split_by_game["game_id"]}": cube_number_by_colour]
    end)
  end

  def reject_colour?(list, constraint) when is_list(list) do
    Enum.map(list, &reject_colour?(&1, constraint))
    |> Enum.any?()
  end

  def reject_colour?(string, constraint) do
    count_by_colour_regex = ~r/(?<count>\d*) (?<colour>red|green|blue)/
    count_by_colour = Regex.named_captures(count_by_colour_regex, string)

    colour = count_by_colour["colour"]
    count = String.to_integer(count_by_colour["count"])

    count > constraint[colour]
  end

  def reject_game?(game, constraint) do
    Enum.reject(game, fn game_tuple ->
      {_, colours} = game_tuple

      reject_colour?(colours, constraint)
    end)
  end

  def reject_games(games, constraint) do
    Enum.map(games, &reject_game?(&1, constraint))
    |> Enum.reject(&Enum.empty?/1)
  end

  def sum_game_ids(list) do
    Enum.reduce(list, 0, fn game, acc ->
      [{id_atom, _}] = game
      id_string = Atom.to_string(id_atom)
      id = String.to_integer(id_string)

      acc + id
    end)
  end

  def part2(_args) do
  end
end
