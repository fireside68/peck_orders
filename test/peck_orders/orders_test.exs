defmodule PeckOrders.OrdersTest do
  @moduledoc false
  use PeckOrders.DataCase, async: true

  alias PeckOrders.Orders

  describe "orders" do
    alias PeckOrders.Orders.Order

    @valid_attrs %{customer_name: "Test Customer", status: "placed", total: 123.45}
    @update_attrs %{status: "delivered"}
    @invalid_attrs %{customer_name: nil, status: nil, total: nil}

    test "list_orders/0 returns all orders" do
      {:ok, order} = Orders.create_order(@valid_attrs)
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      {:ok, order} = Orders.create_order(@valid_attrs)
      assert Orders.get_order!(order.id).id == order.id
    end

    test "create_order/1 with valid data creates an order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.customer_name == "Test Customer"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 updates the order" do
      {:ok, order} = Orders.create_order(@valid_attrs)
      assert {:ok, %Order{} = updated} = Orders.update_order(order, @update_attrs)
      assert updated.status == "delivered"
    end

    test "delete_order/1 deletes the order" do
      {:ok, order} = Orders.create_order(@valid_attrs)
      assert {:ok, _} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end
  end
end
