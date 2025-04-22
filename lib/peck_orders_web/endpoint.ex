defmodule PeckOrdersWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :peck_orders

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_peck_orders_key",
    signing_salt: "HWvIJ0zo",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  socket "/socket", PeckOrdersWeb.UserSocket,
    websocket: [connect_info: [:peer_data, :x_headers, :uri]],
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :peck_orders,
    gzip: false,
    only: PeckOrdersWeb.static_paths()

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :peck_orders
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug CORSPlug,
    origin: [
      "http://localhost:5173",
      "https://peck-orders.fly.dev",
      "https://peck-orders-ui.fly.dev"
    ],
    max_age: 86_400,
    methods: ["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    credentials: true,
    headers: ["Authorization", "Content-Type"]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug PeckOrdersWeb.Router

  def cors_origins(_conn) do
    IO.inspect(Application.get_env(:peck_orders, :cors_origins, ["*"]), label: "CORS Origins")

    Application.get_env(:peck_orders, :cors_origins, ["*"])
  end
end
