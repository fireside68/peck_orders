defmodule PeckOrdersWeb.OrderJSON do
  alias PeckOrders.Orders.Order

  @doc """
  Renders a list of orders.
  """
  def index(%{orders: orders}) do
    %{data: for(order <- orders, do: data(order))}
  end

  @doc """
  Renders a single order.
  """
  def show(%{order: order}) do
    %{data: data(order)}
  end

  defp data(%Order{} = order) do
    %{
      id: order.id,
      customer_name: order.customer_name,
      status: order.status,
      total: order.total
    }
  end
end
