defmodule Memory do
  use GenServer

  # Client API
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def add(pid, a) do
    GenServer.cast(pid, {:add, a})
  end

  def sub(pid, a) do
    GenServer.cast(pid, {:sub, a})
  end

  def show_state(pid) do
    GenServer.call(pid, :show_state)
  end

  # Server callbacks
  def init(state) do
    {:ok, state}
  end

  def handle_cast({:add, a}, state) do
    {:noreply, state + a}
  end

  def handle_cast({:sub, a}, state) do
    {:noreply, state - a}
  end

  def handle_call(:show_state, _from, state) do
    {:reply, state, state}
  end
end
