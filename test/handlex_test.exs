defmodule HandlexTest do
  use ExUnit.Case
  import Handlex

  describe "left ~> right" do
    test "it returns left if left doesn't match with {:ok, _}" do
      10 ~> Kernel.+(10)
    end

    test "it runs right function with second value from left tuple as first parameter" do
    end
  end

  describe "left <~ right" do
    test "it returns left if left doesn't match with {:error, _}" do
    end

    test "it runs right function with second value from left tuple as first parameter" do
    end
  end

  describe "left <~> right" do
    test "it returns left" do
    end

    test "it runs right function with left as first parameter" do
    end
  end
end
