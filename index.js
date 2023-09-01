const express = require("express");

const app = express();

require("dotenv").config();

const port = process.env.PORT;

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

app.get("/", (req, res) => {
  res.json({
    message: "Entry File",
  });
});
