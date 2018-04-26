/*
 //note
 */
var express = require('express'), //khai báo moudle dưới tên biến là express
    dangban = require('../models/dangbanRepo'), // khai báo đường dẫn với tên biến là dangban
    sanpham3 = require('../models/indexRepo'), //như trên
    q = require('q');

var r = express.Router(); //khai báo biến r là routing

r.get('/', function(req, res) { // '/' là url
    q.all([sanpham3.loadbac3()]) //lấy hết tất cả các sản phẩm loại3 load lên 
        //spread ở đây là tách ra 1 key 1 value
        .spread(function(pRow1)
        {
            var vm = {
                layoutModels: res.locals.layoutModels,
            }
            res.render('Tài khoản/dangbannew', vm);
            //xuất ra dưới đường url trên chứa tham số key và value
        })
});


/*

 r.get('/', function(req, res) {
 console.log(req.body.link1);
 var vm = {
 layout: false,
 };
 res.render('Tài khoản/dangbannew', vm);
 });
 */

r.post('/', function(req, res) {
    //gửi yêu cầu về server ko hiện parameter trên thanh browser

    //console.log(req.body.tensnapham);

    //console.log(req.body.link1);
    //console.log(req.body.tensanpham);
    //console.log(req.body.motachitietsanpham);

    //khai báo 2 kiểu entity như là 1 cấu trúc json, gồm có key và vlue
    // dự đoán rằng cái này sẽ gửi về server với cấu trúc này :))
    var entity = {
        link1: req.body.link1,
        link2: req.body.link2,
        link3: req.body.link3,
        chonloaisanpham: req.body.chonloaisanpham,
        tensanpham: req.body.tensanpham,
        giakhoidiem: req.body.giakhoidiem,
        giamuangay: req.body.giamuangay,
        motachitiet: req.body.motachitietsanpham,
        buocgia: req.body.buocgia,
        idnguoiban: req.session.user.id,
        tudonggiahan: req.body.tudonggiahan,
        thoigiandang: req.body.thoigiandang,
        thoigianketthuc: req.body.thoigianketthuc,
        motangangon: req.body.motangangon

    };

    //console.log(entity.tudonggiahan);

    //trả về cái thông tin entity bên trên
    dangban.dangsanpham123(entity)
        .then(function(rows) {
            var vm = {
                layoutNGuoidung: false,
                timkiem123: rows,
                //gửi về trạng thái người dùng
                //thông tin tìm kiếm
            };
            //console.log(vm)
            res.render('Tài khoản/dangbannew', vm);
            //trả về trang như url trên
        }).fail(function(err) {
        console.log(err);
        res.end('fail');
    });

});

/*app.get('/test.js', function(req, res) {
 res.set('Content-Type', 'application/javascript');
 res.render('testPage', { myVar : 'TEST'});
 });*/


/*
 r.post('/add', function(req, res) {
 console.log(req.body.input700);
 categoryRepo.insert(req.body).then(function(data) {
 var vm = {
 layout: false,
 };
 res.render('Tài khoản/dangbannew', vm);
 })
 });*/
module.exports = r;
//trả về routing (đường dẫn 