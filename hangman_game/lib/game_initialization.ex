defmodule Game_initialization do
  use GenServer

  def start_link do
      GenServer.start_link(__MODULE__, [], name: :initialization)
  end

  def start_cast() do
  	  GenServer.cast(:initialization,{:hanged})
  end

  def handle_cast({:hanged}, state) do
      Player.start()
      {:noreply, state}
  end

end