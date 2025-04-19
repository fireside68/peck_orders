import { Socket } from "phoenix";

const devSocketUrl = "ws://localhost:4000/socket";
const prodSocketUrl = "wss://peck-orders.fly.dev/socket";
const socketUrl = import.meta.env.MODE === 'production' ? prodSocketUrl : devSocketUrl;
const socket = new Socket(socketUrl);
socket.connect();

export default socket;
