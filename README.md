# 📦 Peck Orders App

A full-stack order viewer built for the [Peck Engineering Assessment](https://github.com/peck/engineering-assessment), featuring a Phoenix backend and a React frontend.

## ✨ Features

- 📋 Displays a list of customer orders with real-time status updates
- 🔄 Uses Phoenix Channels to push live status changes per order
- 🖥️ Polished React UI with Tailwind CSS
- 🧪 Full test coverage for frontend rendering and real-time updates
- ⚡ Lightning-fast dev experience using Vite + TypeScript

## 🧱 Tech Stack

| Layer     | Tech                                |
|----------|-------------------------------------|
| Frontend | React 19 + Vite + TypeScript        |
| Styling  | Tailwind CSS                        |
| Backend  | Elixir + Phoenix 1.7                |
| Live Data| Phoenix Channels (WebSockets)       |
| Testing  | Vitest + React Testing Library      |

---

## 🛠️ Getting Started

### Backend

Make sure you have Elixir, Phoenix, and PostgreSQL set up. Then:

```bash
cd peck-orders-api
mix deps.get
mix ecto.setup
mix phx.server
```

### Frontend

```bash
cd peck-orders-ui
npm install
npm run dev
```

Visit: [http://localhost:5173](http://localhost:5173) locally, [https://peck-orders-ui.fly.dev](https://peck-orders-ui.fly.dev) hosted example

---

### 💼 .env — Required for Local Development

This project uses environment variables stored in a `.env` file at the root of the repo.

If you'd like to run this locally, [contact me](mailto:cjohns0913@gmail.com) for access to the required values.

---

## 🔁 Real-Time Updates

Each order subscribes to a Phoenix channel:
```
orders:<order_id>
```

The backend can push updates like:
```json
{ "event": "status_update", "payload": { "status": "delivered" } }
```

The frontend receives this and updates the badge and timestamp instantly.

---

## 🧪 Testing

```bash
npm run test
```

Tests are written using:
- `Vitest` for running and mocking
- `React Testing Library` for DOM assertions

Includes coverage for:
- Order list rendering
- Real-time channel updates
- Status badge updates
- Graceful fallback/default rendering

---

## 🎨 UI Design

- Uses **Tailwind utility classes** for layout and color
- Color-coded status badges:
  - `placed`: 🟡 Yellow
  - `processing`: 🔵 Blue
  - `shipping`: 🟣 Purple
  - `shipped`: 🟤 Indigo
  - `delivered`: 🟢 Green
  - `unknown`: ⚪ Gray

---

## 🤝 Why This Build?

This project demonstrates:

- A strong understanding of **Phoenix Channels and WebSockets**
- Fluency with **modern React architecture** using hooks and modular components
- Practical knowledge of **test-driven development**
- Clean, maintainable code built for performance and developer experience

---

## 🙌 Thanks

Thanks to Peck for the opportunity. Hope this project shows you how I approach full-stack problems: real-time data, clear UI, and confident testing.