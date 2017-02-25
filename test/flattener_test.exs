defmodule FlattenerTest do
  use ExUnit.Case
  import Flattener, only: [flatten: 1]

  doctest Flattener

  test "return empty list unaltered" do
    assert flatten([]) == []
  end

  test "return flat list unaltered" do
    assert flatten([2, 4, 8]) == [2, 4, 8]
  end

  test "returns empty list for nested empty lists" do
    Enum.each([
      [[], [[]], []],
      [[]],
      [[[[[]], [[]]]]]
    ], fn(example) ->
      assert flatten(example) == []
    end)
  end

  test "flatten a simple nested list" do
    assert flatten([2, [4, 8], 16]) == [2, 4, 8, 16]
  end

  test "flatten a more complex nested list" do
    l = [
      [[2]],
      [4, [8], [[16]], []],
      32,
      [[[[[[[64]]]]]]]
    ]
    assert flatten(l) == [2, 4, 8, 16, 32, 64]
  end

end
