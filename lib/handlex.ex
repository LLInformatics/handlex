defmodule Handlex do
  defmacro left ~> right do
    Macro.unpipe(left)
    |> Enum.reduce(fn {x, _}, {y, _} ->
      quote do
        unquote(y) |> unquote(x)
      end
      |> Code.eval_quoted()
    end)
    |> case do
      {{:ok, value}, _} ->
        Code.eval_quoted(
          quote do
            unquote(value) |> unquote(right)
          end
        )
        |> case do
          {value, []} ->
            value

          {value, 0} ->
            value

          value ->
            value
        end

      {value, _} ->
        value
    end
  end

  defmacro left <~ right do
    Macro.unpipe(left)
    |> Enum.reduce(fn {x, _}, {y, _} ->
      quote do
        unquote(y) |> unquote(x)
      end
      |> Code.eval_quoted()
    end)
    |> case do
      {{:error, value}, _} ->
        Code.eval_quoted(
          quote do
            unquote(value) |> unquote(right)
          end
        )
        |> case do
          {value, []} ->
            value

          {value, 0} ->
            value

          value ->
            value
        end

      {value, _} ->
        value
    end
  end
end
