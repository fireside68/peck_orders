interface StatusFilterProps {
  value: string;
  onChange: (value: string) => void;
}

const StatusFilter = ({ value, onChange }: StatusFilterProps) => {
  return (
    <div className="flex justify-center mb-6">
      <select
        className="w-full sm:w-2/3 px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-200"
        value={value}
        onChange={(e) => onChange(e.target.value)}
      >
        <option value="all">All Statuses</option>
        <option value="processing">Processing</option>
        <option value="shipped">Shipped</option>
        <option value="delivered">Delivered</option>
        <option value="placed">Placed</option>
      </select>
    </div>
  );
};

export default StatusFilter;
