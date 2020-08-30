# Handlex
A tiny library for pattern matching `{:ok, value}` and `{:error, value}` tuples with new pipeline operators.

## Installation
   Add handlex to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:handlex, "~> 1.0.0"}]
  end
```

## Usage

### Matching {:ok, value} tuples
`{:ok, 10} ~> do_something()` will work just like `10 |> do_something()`

`10 ~> do_something()` will return left value without calling right function

###  Matching {:error, value} tuples
`{:error, 10} <~ do_something()` will work just like `10 |> do_something()`

`10 <~ do_something()` will return left value without calling right function
