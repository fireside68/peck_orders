export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  safelist: [
    "bg-yellow-400", "text-yellow-900",
    "bg-blue-400", "text-blue-900",
    "bg-purple-400", "text-purple-900",
    "bg-indigo-400", "text-indigo-900",
    "bg-green-400", "text-green-900",
    "bg-gray-300", "text-gray-700"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
