var express = require("express");
var app = express();

app.get('/', function(req, res) {
  res.sendfile("index.html");
});

app.get('/script', function(req, res) {
  res.sendfile("./dist/build_app.js");
});

app.get('/style', function(req, res) {
  res.sendfile("./dist/build_app.css");
});


app.listen(3000, function() {
  console.log("Working on port 3000");
});
