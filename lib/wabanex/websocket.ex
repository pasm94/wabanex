defmodule Wabanex.Websocket do
  use WebSockex

  require Logger

  def start_link(state) do
    WebSockex.start_link("wss://ws.kraken.com", __MODULE__, state)
  end

  @impl true
  def handle_connect(_conn, state) do
    Logger.info("Connected...")

    send(self(), :subscribe)

    {:ok, state}
  end

  @impl true
  def handle_frame({type, msg}, state) do
    IO.puts("Received Message - Type: #{inspect(type)} -- Message: #{inspect(msg)}")
    {:ok, state}
  end

  @impl true
  def handle_cast({:send, {type, msg} = frame}, state) do
    IO.puts("Sending #{type} frame with payload: #{msg}")
    {:reply, frame, state}
  end

  @impl true
  def handle_info(:subscribe, state) do
    subscribe = Jason.encode!(%{"event" => "subscribe", "pair" => ["ANY/THING"]})

    {:reply, {:text, subscribe}, state}
  end
end
