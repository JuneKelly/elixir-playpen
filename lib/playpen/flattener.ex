defmodule Playpen.Flattener do

  def flatten(l) do
    Enum.reduce(l, [], fn(e, acc) ->
      if is_list(e) do
        acc ++ flatten(e)
      else
        acc ++ [e]
      end
    end)
  end

end
