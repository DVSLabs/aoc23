defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @input """
  Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
  Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
  Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
  Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
  Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  """

  @constraint %{
    "red" => 12,
    "green" => 13,
    "blue" => 14
  }

  @valid_blocks ["12 red", "13 green", "2 blue"]
  @invalid_blocks ["13 red", "1 green", "1 blue"]

  @valid_game ["1": @valid_blocks]
  @invalid_game ["2": @invalid_blocks]

  test "part1" do
    result = part1(@input, @constraint)

    assert result === 8
  end

  test "part1 check constraint by colour" do
    assert reject_colour?(@valid_blocks, @constraint) === false
    assert reject_colour?(@invalid_blocks, @constraint) === true
  end

  test "part1 games are properly rejected" do
    assert reject_game?(@valid_game, @constraint) === @valid_game
    assert reject_game?(@invalid_game, @constraint) === []
    assert reject_games([@valid_game, @invalid_game], @constraint) === [@valid_game]
  end

  test "part1 sum game IDs" do
    assert sum_game_ids([@valid_game]) === 1
    assert sum_game_ids([@valid_game, @valid_game]) === 2
  end

  test "part2" do
    result = part2(@input)

    assert result === 2286
  end
end
