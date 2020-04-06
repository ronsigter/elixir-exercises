defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    list
    |>reverse
    |>reduce([], &(fun.(&1) && [&1 | &2] || &2))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    list
    |>reverse
    |>reduce([], &(fun.(&1) && &2 ||[&1 | &2]))
  end

  def reduce([], acc, _f), do: acc

  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  def reverse(l) do
    reduce(l, [], &([&1 | &2]))
  end
end
