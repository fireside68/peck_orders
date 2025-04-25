defmodule PeckOrders.OrderStatusServer do
  @moduledoc false
  use GenServer

  @statuses ["placed", "processing", "shipping", "delivered"]

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    schedule_tick()
    {:ok, state}
  end

  def handle_info(:tick, state) do
    update_random_order()
    schedule_tick()
    {:noreply, state}
  end

  defp order_module, do: Application.get_env(:peck_orders, :order_module, PeckOrders.Orders)

  defp schedule_tick do
    Process.send_after(self(), :tick, 3_000)
  end

  defp update_random_order do
    orders = order_module().list_orders()

    if Enum.any?(orders) do
      order = Enum.random(orders)
      new_status = Enum.random(@statuses)

      {:ok, updated_order} = order_module().update_order(order, %{status: new_status})

      topic = "orders:#{updated_order.id}"

      PeckOrdersWeb.Endpoint.broadcast(topic, "status_update", %{
        id: updated_order.id,
        status: updated_order.status
      })
    end
  end
end
