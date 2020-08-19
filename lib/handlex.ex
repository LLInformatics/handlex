defmodule Handlex do
  defmacro left ~> right do
    [{h, _} | t] = Macro.unpipe({:|>, [], [left, generate_case(:ok, right)]})

    fun = fn {x, pos}, acc ->
      Macro.pipe(acc, x, pos)
    end

    :lists.foldl(fun, h, t)
  end

  defmacro left <~ right do
    [{h, _} | t] = Macro.unpipe({:|>, [], [left, generate_case(:error, right)]})

    fun = fn {x, pos}, acc ->
      Macro.pipe(acc, x, pos)
    end

    :lists.foldl(fun, h, t)
  end

  defp generate_case(status, func) do
    quote do
      case do
        {unquote(status), val} ->
          val |> unquote(func)

        val ->
          val
      end
    end
  end
end
