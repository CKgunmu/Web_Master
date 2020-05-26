var http = require('http');
var server = http.createServer();

var port = 3000;
server.listen(port, function() {
    console.log("웹 서버 시작 %d",port);
})