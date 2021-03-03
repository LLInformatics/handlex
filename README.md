# Handlex
A syntax sugar tiny library for pattern matching `{:ok, value}` and `{:error, value}` tuples with new pipeline operators.

## Installation

The package can be installed by adding `handlex` to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:handlex, "~> 1.0.1"}]
  end
```

## Usage

The entire functionality of this package can be accessed by importing `Handlex` module. Run `import Handlex`, and start piping with Handlex operators: `<~` and `~>`

Matching for {:ok, value} tuples:

```elixir
iex>  import Handlex
iex> {:ok, 10} ~> Kernel.*(10)
100
iex> {:error, 10} ~> Kernel.*(10)
{:error, 10}
iex> 10 ~> Kernel.*(10)
10
```

Matching for {:error, value} tuples:

```elixir
iex> import Handlex
iex> {:error, 10} <~ Kernel.*(10)
100
iex> {:ok, 10} <~ Kernel.*(10)
{:ok, 10}
iex> 10 <~ Kernel.*(10)
10
```
