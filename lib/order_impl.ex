defmodule PeckOrders.OrderImpl do
  @moduledoc """
  Implementation of the order behaviour.
  """

  alias PeckOrders.OrderBehaviour
  alias PeckOrders.Orders

  @behaviour OrderBehaviour

  @impl true
  def list_orders do
    Orders.list_orders()
  end

  @impl true
  def get_order!(id) do
    Orders.get_order!(id)
  end

  @impl true
  def create_order(attrs) do
    Orders.create_order(attrs)
  end

  @impl true
  def update_order(order, attrs) do
    Orders.update_order(order, attrs)
  end

  @impl true
  def delete_order(id) do
    Orders.delete_order(id)
  end
end
