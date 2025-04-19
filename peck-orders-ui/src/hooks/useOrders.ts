import { useEffect, useState } from "react";

export interface Order {
  id: string;
  customer_name: string;
  status: string;
  total: string;
}

export const useOrders = () => {
  const [orders, setOrders] = useState<Order[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const baseUrl =
    import.meta.env.MODE === "production"
      ? import.meta.env.VITE_API_BASE_URL
      : import.meta.env.VITE_API_BASE_DEV_URL;

  useEffect(() => {
    const loadOrders = async () => {
      try {
        const res = await fetch(`${baseUrl}/api/orders`);
        const json = await res.json();
        setOrders(json.data);
        setError(null);
      } catch (err) {
        console.error("Error fetching orders:", err);
        setError("Failed to load orders.");
      } finally {
        setLoading(false);
      }
    };

    loadOrders();
  }, []);

  return { orders, loading, error };
};
