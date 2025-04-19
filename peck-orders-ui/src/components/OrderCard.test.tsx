/// <reference types="vitest/globals" />
import '@testing-library/jest-dom';
import { render, screen, waitFor } from "@testing-library/react";
import { OrderCard } from "./OrderCard";
import * as hookModule from "../hooks/useOrderChannel";
import React from 'react';
import { vi } from 'vitest';
vi.mock("../hooks/useOrderChannel");

test("updates status when channel pushes update", async () => {
  let updateFn: ((newStatus: string) => void) | null = null;

  (hookModule.useOrderChannel as ReturnType<typeof vi.fn>).mockImplementation((_id: any, fn: ((newStatus: string) => void) | null) => {
    updateFn = fn;
  });

  render(<OrderCard order={{ id: "abc", customer_name: "Real-Time Tester", status: "processing", total: "1337" }} />);

  await waitFor(() => {
    if (!updateFn) throw new Error("updateFn not set");
  });

  updateFn!("delivered");

  await waitFor(() => {
    expect(screen.getByText("delivered")).toBeInTheDocument();
  });
});
