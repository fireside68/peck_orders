defmodule PeckOrders.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :customer_name, :string
      add :status, :string
      add :total, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
