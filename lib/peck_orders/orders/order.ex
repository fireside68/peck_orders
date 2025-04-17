defmodule PeckOrders.Orders.Order do
  @moduledoc """
  Order model
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    field :status, :string
    field :total, :decimal
    field :customer_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_name, :status, :total])
    |> validate_required([:customer_name, :status, :total])
  end
end
