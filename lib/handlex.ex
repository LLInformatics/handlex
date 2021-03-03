defmodule Handlex do
  @moduledoc """
    Handlex - syntax sugar package.
  """

  @doc """
  Pipe operator with pattern matching for {:ok, value} tuple, passes value to right. If not matched returns left, ignoring right.
  ## Examples
      iex> {:ok, 10} ~> Kernel.*(10)
      100
      iex> {:error, 10} ~> Kernel.*(10)
      {:error, 10}
      iex> 10 ~> Kernel.*(10)
      10
  """

  defmacro left ~> right do
    [{h, _} | t] = Macro.unpipe({:|>, [], [left, generate_case(:ok, right)]})

    fun = fn {x, pos}, acc ->
      Macro.pipe(acc, x, pos)
    end

    :lists.foldl(fun, h, t)
  end

  @doc """
  Pipe operator with pattern matching for {:error, value} tuple, passes value to right. If not matched returns left, ignoring right.
  ## Examples
      iex> {:error, 10} <~ Kernel.*(10)
      100
      iex> {:ok, 10} <~ Kernel.*(10)
      {:ok, 10}
      iex> 10 <~ Kernel.*(10)
      10
  """

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
