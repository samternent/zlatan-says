var express = require("express");
var app = express();

app.get('/', function(req, res) {
  res.sendfile("index.html");
});

app.get('/script', function(req, res) {
  res.sendfile("dist/build_app.js");
});

app.get('/style', function(req, res) {
  res.sendfile("dist/build_app.css");
});

app.get('/img/zlatan_sil', function(req, res) {
  res.sendfile("assets/img/zlatan.svg");
});

app.get('/img/zlatan_jpg.jpg', function(req, res) {
  res.sendfile("assets/img/zlatan.jpg");
});


app.listen(process.env.PORT || 3000, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});
