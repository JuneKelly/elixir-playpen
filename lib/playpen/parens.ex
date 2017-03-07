defmodule Playpen.Parens do

  def is_balanced(st) do
    characters = String.split(st, "", trim: true)
    {counter, invalid} = Enum.reduce(
      characters,
      {0, false},
      fn(c, {counter, invalid}) ->
        if invalid do
          {counter, invalid}
        else
          case c do
            "(" ->
              {counter+1, invalid}
            ")" ->
              if counter == 0 do
                {counter, true}
              else
                {counter-1, invalid}
              end
            _ ->
              {counter, invalid}
          end
        end
      end
    )
    if invalid do
      false
    else
      counter == 0
    end
  end

end
