defmodule Recursive do

  def gretter(name, count \\ 1) do
      run_times(fn -> IO.puts("Hola #{name}") end, count)
  end

  defp run_times(func, count \\ 1) do
    if count >= 1 do
      func.()
      run_times(func, count - 1)
    end
  end

  def each([], _func), do: nil
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def filter([], _func), do: []
  def filter([head | tail], func), do: (func.(head) && [head] ++ filter(tail, func) || filter(tail, func))

  def reduce([], acc, _func), do: acc
  def reduce([head | tail], acc, func), do: reduce(tail, func.(head, acc), func)
end
