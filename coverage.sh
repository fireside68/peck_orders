#!/bin/bash
echo "🧪 Running Elixir test coverage..."
MIX_ENV=test mix coveralls.html

echo "🧪 Running React test coverage..."
cd peck-orders-ui
npm run coverage