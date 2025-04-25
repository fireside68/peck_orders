defmodule PeckOrders.OrderBehaviour do
  @moduledoc """
  Behaviour for order operations.
  """

  @callback list_orders() :: {:ok, list()} | {:error, term()}
  @callback get_order!(integer()) :: {:ok, map()} | {:error, term()}
  @callback create_order(map()) :: {:ok, map()} | {:error, term()}
  @callback update_order(map(), map()) :: {:ok, map()} | {:error, term()}
  @callback delete_order(map()) :: {:ok, map()} | {:error, term()}
end
