const express = require("express");

const app = express();

app.listen(3421, () => {
  console.log("Server running");
});

app.get("/", (req, res) => {
  res.json({
    message: "Entry File",
  });
});
