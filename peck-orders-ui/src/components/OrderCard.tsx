import { Order } from "../hooks/useOrders";
import { StatusBadge } from "./StatusBadge";

interface Props {
  order: Order;
}

export const OrderCard = ({ order }: Props) => {
  return (
    <div className="border border-gray-200 rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow bg-gray-50">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between">
        <div>
          <p className="text-lg font-semibold text-gray-800">
            {order.customer_name}
          </p>
          <p className="text-sm text-gray-500">Order ID: {order.id}</p>
        </div>

        <div className="mt-2 sm:mt-0 sm:text-right">
          <StatusBadge status={order.status} />
          <p className="text-sm text-gray-600 mt-1">
            Total: <span className="font-medium">${order.total}</span>
          </p>
        </div>
      </div>
    </div>
  );
};
