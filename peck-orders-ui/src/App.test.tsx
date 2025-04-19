import { render, screen } from "@testing-library/react";
import App from "./App";

global.fetch = vi.fn(() =>
  Promise.resolve({
    json: () =>
      Promise.resolve({
        data: [
          { id: "1", customer_name: "A", total: "100", status: "placed" },
          { id: "2", customer_name: "B", total: "200", status: "delivered" },
        ],
      }),
  })
) as any;

test("loads and renders order cards from API", async () => {
  render(<App />);

  expect(await screen.findByText("A")).toBeInTheDocument();
  expect(screen.getByText("B")).toBeInTheDocument();
});
