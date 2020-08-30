defmodule Handlex.MixProject do
  use Mix.Project

  def project do
    [
      app: :handlex,
      version: "1.0.0",
      elixir: "~> 1.10",
      package: package(),
      description: description(),
      deps: deps(),
      name: "Handlex",
      source_url: "https://github.com/llinformatics/handlex"
    ]
  end

  defp description() do
    "Package with ~> and <~ pipe operators to handle :ok and :error tuples"
  end

  defp package() do
    [
      name: "handlex",
      maintainers: ["Dawid Boksa"],
      files: ~w(lib mix.exs README* LICENSE*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/llinformatics/handlex"}
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
