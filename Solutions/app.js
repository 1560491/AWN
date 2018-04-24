var express = require("express");
var app = express();
app.use(express.static("public"));
app.set("view engine", "html");
app.set("views", "./views");
//connect port
var port = 3000;
app.listen(port, function (err) {
    if (typeof (err) == "undefined") {
        console.log('Your application is running on : ' + port + ' port');
    }
});