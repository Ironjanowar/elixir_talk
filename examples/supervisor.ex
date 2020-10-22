defmodule Counter do
  use GenServer

  # Client API
  def start_link(default) do
    GenServer.start_link(__MODULE__, default, name: Counter)
  end

  def increment() do
    GenServer.cast(Counter, :inc)
  end

  def crash() do
    GenServer.cast(Counter, :crash)
  end

  def show_state() do
    GenServer.call(Counter, :show_state)
  end

  # Server callbacks
  def init(state) do
    {:ok, state}
  end

  def handle_call(:show_state, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:inc, state) do
    {:noreply, state + 1}
  end

  def handle_cast(:crash, [head | _]) do
    {:noreply, head}
  end
end

# children = [
#   %{
#     id: Counter,
#     start: {Counter, :start_link, [0]}
#   }
# ]

# {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)

# Supervisor.which_children(pid)
