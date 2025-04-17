alias PeckOrders.Orders

Enum.each(1..5, fn i ->
  Orders.create_order(%{
    customer_name: "Customer #{i}",
    status: Enum.random(["received", "preparing", "shipped", "delivered"]),
    total: Enum.random(100..500)
  })
end)
