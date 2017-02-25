defmodule Flattener do

  def flatten(l) do
    Enum.reduce(l, [], fn(i, acc) ->
      case is_list(i) do
        true ->
          acc ++ flatten(i)
        _ ->
          acc ++ [i]
      end
    end)
  end

end
