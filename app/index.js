const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (_req, res) => res.send('Hello from DevOps Project (dev)! 🙌'));
app.get('/health', (_req, res) => res.json({ status: 'ok', ts: Date.now() }));

app.listen(port, () => console.log(`App listening on ${port}`));
