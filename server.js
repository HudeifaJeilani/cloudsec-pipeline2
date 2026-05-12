const express = require("express");
const path = require("path");
const fs = require("fs");

const app = express();
const PORT = process.env.PORT || 80;

const buildPath = path.join(__dirname, "build");
const indexPath = path.join(buildPath, "index.html");

console.log("Starting server...");
console.log("Build path:", buildPath);
console.log("Build exists:", fs.existsSync(buildPath));
console.log("Index exists:", fs.existsSync(indexPath));

app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

app.use(express.static(buildPath));

app.use((req, res) => {
  res.sendFile(indexPath);
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});