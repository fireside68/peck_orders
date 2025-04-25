/// <reference types="vitest/globals" />
import '@testing-library/jest-dom';
import { render, screen } from "@testing-library/react";
import React from 'react';
import { OrderCard } from "./OrderCard";

const mockOrder = {
  id: "abc123",
  customer_name: "Real-Time Tester",
  status: "processing",
  total: "1337"
};

describe("OrderCard", () => {
  test("renders the customer's name", () => {
    render(<OrderCard order={mockOrder} />);
    expect(screen.getByText("Real-Time Tester")).toBeInTheDocument();
  });

  test("renders the order ID", () => {
    render(<OrderCard order={mockOrder} />);
    expect(screen.getByText(/Order ID: abc123/)).toBeInTheDocument();
  });

  test("renders the status badge", () => {
    render(<OrderCard order={mockOrder} />);
    expect(screen.getByText("processing")).toBeInTheDocument();
  });

  test("renders the total price", () => {
    render(<OrderCard order={mockOrder} />);
    expect(screen.getByText("$1337")).toBeInTheDocument();
  });
});
