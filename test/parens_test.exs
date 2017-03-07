defmodule ParensTest do
  use ExUnit.Case
  import Playpen.Parens, only: [is_balanced: 1]

  doctest Playpen.Parens

  test "return true for empty string" do
    assert is_balanced("") == true
  end

  test "return true for '()'" do
    assert is_balanced("()") == true
  end

  test "return false for ')('" do
    assert is_balanced(")(") == false
  end

  test "return false for ')'" do
    assert is_balanced(")") == false
  end

  test "return false for '('" do
    assert is_balanced("(") == false
  end

  test "return true for various well-balanced paren-strings" do
    Enum.each([
      "()()()",
      "((((()))))",
      "(()((()(())(()))))"
    ], fn(example) ->
      assert is_balanced(example) == true
    end)
  end

  test "return false for various non-balanced paren-strings" do
    Enum.each([
      "()()(",
      "((((())))",
      "(()(()(())(()))))"
    ], fn(example) ->
      assert is_balanced(example) == false
    end)
  end
end
