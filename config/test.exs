import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :peck_orders, PeckOrders.Repo,
  username: "postgres",
  password: "P@$$W0RD",
  hostname: "localhost",
  database: "peck_orders_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :peck_orders, PeckOrdersWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tp6UcKxP9FMAkZkQvuTlCJYj2Ym8ZBvtccdkHiv7dXkDQjGuPfQNatwnobUpDya2",
  server: false

# Mocking the Orders behaviour for testing
config :peck_orders, :order_module, PeckOrders.OrdersMock

# In test we don't send emails
config :peck_orders, PeckOrders.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
