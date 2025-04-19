import { OrderCard } from "./OrderCard";
import { LoadingIndicator } from "./ui/LoadingIndicator";
import { ErrorBanner } from "./ui/ErrorBanner";
import { Order, useOrders } from "../hooks/useOrders";
import { useEffect, useState } from "react";
import { useOrderChannel } from "../hooks/useOrderChannel";

interface OrdersListProps {
  searchTerm: string;
  statusFilter: string;
}

const OrdersList = ({ searchTerm, statusFilter }: OrdersListProps) => {
  const { orders, loading, error } = useOrders();
  const [localOrders, setLocalOrders] = useState<Order[]>([]);

  useEffect(() => {
    setLocalOrders(orders);
  }, [orders]);
  useOrderChannel(localOrders, setLocalOrders);

  if (loading) return <LoadingIndicator />;
  if (error) return <ErrorBanner message={error} />;

  const filteredOrders = localOrders.filter((order) => {
    const normalizedStatus = order.status.trim().toLowerCase();
    const matchesSearch =
      order.customer_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      order.id.toLowerCase().includes(searchTerm.toLowerCase());

    const matchesStatus =
      statusFilter === "all" || normalizedStatus === statusFilter.trim().toLocaleLowerCase();

    return matchesSearch && matchesStatus;
  });

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-4">
      {filteredOrders.length === 0 ? (
        <p className="text-center text-sm text-gray-500 col-span-full">
          No matching orders found.
        </p>
      ) : (
        filteredOrders.map((order) => (
          <OrderCard key={order.id} order={order} />
        ))
      )}
    </div>
  );
};

export default OrdersList;
