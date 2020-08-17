defmodule Handlex.MixProject do
  use Mix.Project

  def project do
    [
      app: :handlex,
      version: "1.0.0",
      elixir: "~> 1.10",
      deps: deps(),
      name: "Handlex"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end
end
