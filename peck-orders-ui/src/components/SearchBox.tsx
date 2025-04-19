interface SearchBoxProps {
  value: string;
  onChange: (value: string) => void;
}

const SearchBox = ({ onChange }: SearchBoxProps) => {
  return (
    <div className="flex justify-center mb-6">
      <input
        type="text"
        placeholder="Search orders by name or ID"
        className="w-full sm:w-2/3 px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-200"
        onChange={(e) => onChange(e.target.value)}
      />
    </div>
  );
};

export default SearchBox;
