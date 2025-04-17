defmodule PeckOrders.Repo do
  use Ecto.Repo,
    otp_app: :peck_orders,
    adapter: Ecto.Adapters.Postgres
end
