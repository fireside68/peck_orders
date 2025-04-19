defmodule PeckOrdersWeb.OrderChannel do
  @moduledoc false
  use PeckOrdersWeb, :channel

  def join("orders:" <> order_id, _payload, socket) do
    # order_id = String.to_integer(order_id)
    Phoenix.PubSub.subscribe(PeckOrders.PubSub, "orders:#{order_id}")
    {:ok, assign(socket, :order_id, order_id)}
  end

  def handle_info(%{order_id: id, status: status}, socket) do
    push(socket, "status_update", %{order_id: id, status: status})
    {:noreply, socket}
  end

  def handle_out("status_update", payload, socket) do
    push(socket, "status_update", payload)
    {:noreply, socket}
  end
end
