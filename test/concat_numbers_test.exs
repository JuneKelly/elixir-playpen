defmodule ConcatNumbersTest do
  use ExUnit.Case
  import Playpen.ConcatNumbers, only: [concat_numbers: 2, places: 1]

  doctest Playpen.ConcatNumbers

  test "places should deturn the number of places in a number" do
    assert places(2) == 1
    assert places(22) == 2
    assert places(222) == 3
    assert places(2222) == 4
  end

  test "concat_numbers should concatinate numbers" do
    Enum.each(
      [
        {{11, 2}, 112},
        {{0, 4}, 4},
        {{4, 24}, 424},
        {{18735, 28737}, 1873528737}
      ], fn({{a, b}, result}) ->
        assert concat_numbers(a, b) == result
      end
    )
  end
end
