defmodule PeckOrders.ReleaseTasks do
  @moduledoc false
  use Mix.Task
  alias PeckOrders.Orders
  @shortdoc "Seed the database with sample data"
  @recursive true
  @doc """
  Seed the database with sample data.
  This task creates 10 sample orders with random statuses and totals.
  """
  def run(_args) do
    Mix.Task.run("app.start")
    seed()
  end

  @spec seed() :: :ok
  @doc false
  def seed do
    IO.puts("Seeding...")

    Enum.each(1..10, fn i ->
      Orders.create_order(%{
        customer_name: "Customer #{i}",
        status: Enum.random(["received", "preparing", "shipped", "delivered"]),
        total: Enum.random(100..500)
      })
    end)
  end
end
