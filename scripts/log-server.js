// $ETERNUM_PATH/scripts/log-server.js
const express = require('express');
const fs = require('fs');
const app = express();

app.use(express.json());

app.post('/log', (req, res) => {
  const line = `[${new Date().toISOString()}] ${JSON.stringify(req.body)}\n`;
  // Save logs to a persistent audit file
  fs.appendFileSync(process.env.ETERNUM_PATH + '/audit/eternum_audit.log', line);
  console.log(line.trim());
  res.sendStatus(200);
});

app.listen(3001, () => {
  console.log('🔥 Log server active on http://localhost:3001');
});
