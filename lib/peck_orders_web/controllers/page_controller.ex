defmodule PeckOrdersWeb.PageController do
  @moduledoc false
  use PeckOrdersWeb, :controller

  def index(conn, _params) do
    text(conn, "API is running. Now go build something awesome.")
  end
end
