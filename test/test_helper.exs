Mox.defmock(PeckOrders.OrdersMock, for: PeckOrders.OrderBehaviour)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PeckOrders.Repo, :manual)
