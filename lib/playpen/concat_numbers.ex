defmodule Playpen.ConcatNumbers do

  def concat_numbers(a, b) do
    case a do
      0 -> b
      _ ->
        shifted = a * :math.pow(10, places(b))
        shifted + b
    end
  end

  def places(n) do
    places(n, 0)
  end

  def places(n, acc) do
    if n < 10 do
      acc + 1
    else
      places(n/10, acc+1)
    end
  end


end
