const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Health check endpoint for CI/CD pipeline
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP', timestamp: new Date() });
});

// API endpoint simulating deployment status
app.get('/api/deployments', (req, res) => {
  res.json([
    { id: 1, service: 'User-Service', status: 'Healthy', version: 'v1.2.0', lastDeployed: '2 mins ago' },
    { id: 2, service: 'Payment-Gateway', status: 'Healthy', version: 'v2.0.1', lastDeployed: '1 hour ago' },
    { id: 3, service: 'Inventory-DB', status: 'Syncing', version: 'v1.1.5', lastDeployed: '10 mins ago' },
    { id: 4, service: 'Frontend-App', status: 'Healthy', version: 'v3.4.0', lastDeployed: '5 mins ago' }
  ]);
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(port, () => {
  console.log(`CloudDeploy Platform running on port ${port}`);
});
