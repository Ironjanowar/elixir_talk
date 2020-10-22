defmodule Loop do
  def loop(state) do
    receive do
      {:add, a} ->
        loop(state + a)

      :show_state ->
        IO.puts("The current state is #{state}")
        loop(state)

      _ ->
        IO.puts("Unrecognized error")
        loop(state)
    end
  end
end
