const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 80;

// Serve the built frontend files
app.use(express.static(path.join(__dirname, 'build')));

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Catch-all for React routes
app.use((req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});