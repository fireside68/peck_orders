defmodule PeckOrdersWeb.UserSocket do
  @moduledoc false
  use Phoenix.Socket

  # Channel route for order updates
  channel "orders:*", PeckOrdersWeb.OrderChannel

  @impl true
  def connect(_params, socket, _connect_info), do: {:ok, socket}

  @impl true
  def id(_socket), do: nil
end
