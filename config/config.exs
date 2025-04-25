# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :peck_orders,
  ecto_repos: [PeckOrders.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :peck_orders, PeckOrdersWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: PeckOrdersWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PeckOrders.PubSub,
  live_view: [signing_salt: "UufRY/wb"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :peck_orders, PeckOrders.Mailer, adapter: Swoosh.Adapters.Local

if config_env() == :prod do
  config :peck_orders, :cors_origins, ["https://peck-orders-ui.fly.dev"]
else
  config :peck_orders, :cors_origins, ["*"]
end

config :peck_orders, :order_module, PeckOrders.OrderImpl

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
