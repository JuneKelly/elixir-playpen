defmodule Flattener do

  def flatten(l) do
    Enum.reduce(l, [], fn(i, acc) ->
      if is_list(i) do
        acc ++ flatten(i)
      else
        acc ++ [i]
      end
    end)
  end

end
