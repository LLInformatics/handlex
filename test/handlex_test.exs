defmodule HandlexTest do
  use ExUnit.Case
  import Handlex

  defp ok_tuple(value), do: {:ok, value}
  defp error_tuple(value), do: {:error, value}

  describe "left ~> right" do
    test "it returns left if left doesn't match with {:ok, _}" do
      assert 10 ~> Kernel.+(10) == 10

      assert 10 |> Kernel.+(20) ~> Kernel.-(100) == 30

      assert 10
             ~> Kernel.+(10)
             |> error_tuple()
             ~> Kernel.+(30) ==
               {:error, 10}
    end

    test "it runs right function with second value from left tuple as first parameter" do
      assert 10
             ~> Kernel.+(10)
             |> ok_tuple()
             ~> Kernel.+(30) ==
               40

      assert {:ok, 10}
             ~> Kernel.+(10)
             |> ok_tuple()
             ~> Kernel.+(30) ==
               50
    end
  end

  describe "left <~ right" do
    test "it returns left if left doesn't match with {:error, _}" do
      assert 10 <~ Kernel.+(10) == 10

      assert 10 |> Kernel.+(20) <~ Kernel.-(100) == 30

      assert 10
             <~ Kernel.+(10)
             |> ok_tuple()
             <~ Kernel.+(30) ==
               {:ok, 10}
    end

    test "it runs right function with second value from left tuple as first parameter" do
      assert 10
             <~ Kernel.+(10)
             |> error_tuple()
             <~ Kernel.+(30)
             |> Kernel.+(5) ==
               45
    end
  end
end
