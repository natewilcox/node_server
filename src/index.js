const express = require('express');
const os = require('os');
const packageJson = require('../package.json');

const app = express();
const port = 8080;

app.get('/', (req, res) => {
  console.log("Hello world received a request.");
  console.log(process.env)
  const label = process.env.label;

  res.send(`${label} from ${os.hostname()} running version ${packageJson.version}`);
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});