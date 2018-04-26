
//note
var express = require('express'),  //khai báo moudle
    danhsachnguoidung = require('../models/danhsachnguoidungRepo'), //khai báo url bằng biến
    q = require('q'); //khai báo moudle xử lí callback hell
var r = express.Router(); //khai báo route moudle
r.get('/', function(req, res) {
    if(req.session.isLogged===true) //nếu đã đăng nhập (kiểm tra đăng nhập hay chưa )
    {
        if(req.session.isQL===true) { //trong database có tồn tại
            danhsachnguoidung.load() //xuất ra danh sách người dùng
                .then(function (rows) { //
                    var vm = {
                       layoutNGuoidung: false, //nếu chưa hiển thị
                        
                        nguoidung: rows, //xuât người dùng theo biến rows
                    };
                    res.render('Quản trị/quanlynguoidung', vm); // xuất ra trang theo đường dẫn trên
                }).fail(function (err) {
                console.log(err);
                res.end('fail');
            });
        }
        else {
            res.redirect('/');
            //nếu không có dữ liệu thì trả về root (có thể làm home)
        }
    }
    else{
        res.redirect('/taikhoan/dangnhap');
        //chuyển hướng người dùng tới trang tài khoản đăng nhập
    }

});
 module.exports = r;
//trả về route