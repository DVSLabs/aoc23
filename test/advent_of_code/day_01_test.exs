defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

    result = part1(input)

    assert result === 142
  end

  test "part2" do
    input = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """

    result = part2(input)

    assert result === 281
  end

  test "part2 edgecases" do
    input = """
    12oneightfve
    """

    result = part2(input)

    assert result === 18
  end

  test "empty input returns 0" do
    empty = ""

    part1_result = part1(empty)
    part2_result = part2(empty)

    assert part1_result === 0
    assert part2_result === 0
  end
end
