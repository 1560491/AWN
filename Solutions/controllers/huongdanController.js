/**
 * Created by MiM on 23/06/2017.
 */
var express = require('express'), //khai báo module dưới dạng 1 biến
    q = require('q'); //q : callback hell
var huongdan = express.Router();
huongdan.get('/', function(req, res) {
    //gửi yêu cầu về server có show inf parameter
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/huongdan',vm);
});
huongdan.get('/1', function(req, res) {
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/Các trang hướng dẫn/dangkydaugia',vm);
});
huongdan.get('/2', function(req, res) {
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/Các trang hướng dẫn/kygui',vm);
});
huongdan.get('/3', function(req, res) {
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/Các trang hướng dẫn/topicdaugia',vm);
});
huongdan.get('/4', function(req, res) {
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/Các trang hướng dẫn/quydinhtaodaugia',vm);
});
huongdan.get('/5', function(req, res) {
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/Các trang hướng dẫn/bannick',vm);
});
huongdan.get('/6', function(req, res) {
    var vm= {
        layouthuongdan: true,
    }
    res.render('Hướng dẫn/Các trang hướng dẫn/daugia',vm);
});
module.exports = huongdan;