defmodule PeckOrders.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PeckOrders.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        customer_name: "some customer_name",
        status: "some status",
        total: "120.5"
      })
      |> PeckOrders.Orders.create_order()

    order
  end
end
