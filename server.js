const express = require('express');
const path = require('path');
const serveStatic = require('serve-static');
const port = process.env.PORT || 8080;

app = express();
app.use(serveStatic(__dirname + '/dist'));
app.listen(port);
app.use(function(req, res, next) {
  res.status(404).sendFile(path.resolve(__dirname, './dist/index.html'));
});
console.log('server started ' + port);

