# Linear recursive

defmodule LinearFactorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n - 1)
  end
end

# Tail Recursive

defmodule TailFactorial do
	def of(n), do: of(n, 1)
	defp of(0, current_factorial), do: current_factorial
	defp of(n, current_factorial) when n > 0, do: of(n - 1, current_factorial * n)
end
