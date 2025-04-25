defmodule PeckOrders.OrderStatusServerTest do
  @moduledoc false
  use ExUnit.Case, async: false
  import Mox
  import ExUnit.CaptureLog

  setup :verify_on_exit!

  defmodule FakeEndpoint do
    @moduledoc false
    def broadcast(topic, event, payload), do: send(self(), {:broadcast, topic, event, payload})
  end

  setup do
    Application.put_env(:peck_orders, :orders, PeckOrders.OrdersMock)
    stub(PeckOrders.OrdersMock, :list_orders, fn -> [] end)
    :ok
  end

  test "starts the GenServer" do
    assert {:ok, _pid} = PeckOrders.OrderStatusServer.start_link(nil)
  end

  test "does nothing if there are no orders" do
    PeckOrders.OrdersMock
    |> expect(:list_orders, fn -> [] end)

    send(self(), :tick)

    capture_log(fn ->
      PeckOrders.OrderStatusServer.handle_info(:tick, %{})
    end)

    assert_received {:noreply, _}
  end

  test "updates a random order and broadcasts" do
    Application.put_env(:peck_orders, :endpoint, __MODULE__.FakeEndpoint)

    order = %{id: 1, status: "placed"}

    PeckOrders.OrdersMock
    |> expect(:list_orders, fn -> [order] end)
    |> expect(:update_order, fn ^order, %{status: status} ->
      assert status in ["placed", "processing", "shipping", "delivered"]
      {:ok, %{order | status: status}}
    end)

    send(self(), :tick)

    capture_log(fn ->
      PeckOrders.OrderStatusServer.handle_info(:tick, %{})
    end)

    assert_received {:broadcast, "orders:1", "status_update", %{id: 1, status: _}}
  end
end
