import { useEffect } from "react";
import socket from "../socket";
import { Order } from "./useOrders";

export const useOrderChannel = (
  orders: Order[],
  setOrders: React.Dispatch<React.SetStateAction<Order[]>>
) => {
  useEffect(() => {
    const cleanups: (() => void)[] = [];

    orders.forEach((order) => {
      const channel = socket.channel(`orders:${order.id}`, {});

      channel
        .join()
        .receive("ok", () => console.log(`Joined orders:${order.id}`))
        .receive("error", () =>
          console.error(`Failed to join orders:${order.id}`)
        );

      channel.on("status_update", (payload: { status: string }) => {
        setOrders((prev) =>
          prev.map((o) =>
            o.id === order.id ? { ...o, status: payload.status } : o
          )
        );
      });

      cleanups.push(() => {
        channel.leave();
      });
    });

    return () => {
      cleanups.forEach((cleanup) => cleanup());
    };
  }, [orders, setOrders]);
};
