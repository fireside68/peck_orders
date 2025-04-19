import { useMemo, useState } from "react";
import debounce from "lodash/debounce";
import OrdersList from "./components/OrdersList";
import SearchBox from "./components/SearchBox";
import StatusFilter from "./components/StatusFilter";

function App() {
  const [searchTerm, setSearchTerm] = useState("");
  const [statusFilter, setStatusFilter] = useState<string>("all");
  const debouncedSetSearchTerm = useMemo(() =>
    debounce((value: string) => setSearchTerm(value), 300),
    []
  );
  return (
    <div className="max-w-6xl mx-auto mt-10 px-4">
      <h1 className="text-3xl font-bold mb-6 text-center">📦 Peck Orders</h1>
      <SearchBox value={searchTerm} onChange={debouncedSetSearchTerm} />
      <StatusFilter value={statusFilter} onChange={setStatusFilter} />
      <OrdersList searchTerm={searchTerm} statusFilter={statusFilter} />
    </div>
  );
}

export default App;
