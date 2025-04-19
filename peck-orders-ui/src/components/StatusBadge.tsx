interface Props {
  status: string;
}

const statusStyles: Record<string, string> = {
  placed: "bg-yellow-400 text-yellow-900",
  processing: "bg-blue-400 text-blue-900",
  shipping: "bg-purple-400 text-purple-900",
  shipped: "bg-indigo-400 text-indigo-900",
  delivered: "bg-green-400 text-green-900",
};

export const StatusBadge = ({ status }: Props) => {
  const normalized = status.toLowerCase();
  const style = statusStyles[normalized] || "bg-gray-300 text-black";

  return (
    <span
      className={`inline-block px-3 py-1 rounded-full text-sm font-semibold uppercase transition-colors duration-500 ease-in-out ${style}`}
    >
      {status}
    </span>
  );
};
