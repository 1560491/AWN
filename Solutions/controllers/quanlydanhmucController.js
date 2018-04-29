//controller ở đây chứ DTO và 
var express = require('express'),
        //khai báo moudle dưới dạng tên biến
    danhmuc = require('../models/quanlydanhmucRepo'), //khai báo đường link dưới dạng tên biến 
    q = require('q'); // khai báo moudle q : là  moudle xử lí call back
var r = express.Router(); //khai báo routing
r.get('/', function(req, res) { 
    //GET: gửi data từ client về server hiển thị parameter trên url của browser.
    if(req.session.isLogged===true)
    //xác nhận đã đăng nhập là rồi thì mới cho dô đây :))
    {
        if(req.session.isQL===true) { //nếu dữ liệu đăng nhập trên sql tồn tại
            q.all([danhmuc.loadbac1(), danhmuc.loadbac2(), danhmuc.loadbac3()])
                .spread(function (pRow1, pRow2, pRow3) {
                    //được hiểu dống như C#
                    //Lớp DTO, đây không phải là layer, đây chỉ là 1 gói dữ liệu đươc trao đổi giữa các lớp.
                    // Gói dữ liệu này được xây dựng dưới dạng lớp đối tượng. Mỗi một công nhân sẽ mang những thuộc tính sau:
                    var vm = {
                        layoutdanhmuc: true,
                        bac1: pRow1,
                        bac2: pRow2,
                        bac3: pRow3,
                    }
                    res.render('Quản trị/quanlydanhsachdanhmuc', vm);
                    //trả về khung trang của quản trị/quanlydanhsachdanhmuc
                })
        }
        else {
            res.redirect('/');
            //còn cái này nếu chưa đăng nhập thì ra đây :)))

        }
    }
});
//post gửi req về server ko hiện parameter
r.post('/', function(req, res) {
    var entity={
        ten:req.body.tendanhmuc,
        id2:req.body.values
        //gửi tên và id2 về server
    }
    danhmuc.them(entity).then(function (affe) {
        //xử lí và trả kết quả về client theo url bên dưới
        res.redirect('/quanlidanhmuc');
    })
});
//muốn sửa thì hàm nãy sẽ đáp ứng
r.get('/sua', function(req, res) {
    var entity={
        id:req.query.id
        //gửi id về server
    }
    danhmuc.loadbac3theoid(entity).then(function (rows) {
        var vm={
            danhmuc3:rows
        }
        console.log(vm);
        res.render('Quản trị/suadanhmuc',vm);
        //cái này không biết sửa 1 cái hay nhiều cái trên cùng 1 row thông tin
    })
});r.post('/sua', function(req, res) {
    var entity={
        id:req.body.id,
        ten:req.body.ten,
        //thanh niên post này gửi về nữa à :))
        //cái này bị che dữ liệu gửi về trên browser
    }
    danhmuc.sua(entity).then(function (rows) {
        res.redirect('/quanlidanhmuc');
        //trả về trang quản lí danh mục
    })
});
//gửi về infor bị che mắt :))
r.post('/xoa', function(req, res) {
    var entity={
        id:req.body.id,
        //gồm thông tin ID thôi nhé
    }
    console.log(entity)
    //xuất ra trên terminal cho vui :))
    q.all([danhmuc.loadsanpham(entity)]) //q đương nhiên là xử lí callback hell ròi :))
    //load sản phẩm lên chơi cho dui nào :))
        .spread(function(pRow1) //tách ra thành các thành phần chỉ có spread
        {
            var vm = {
                NoProDuct:pRow1.length===0,
            }
            console.log(vm);
            if(vm.NoProDuct===false)
            {
                q.all([danhmuc.loadbac1(), danhmuc.loadbac2(), danhmuc.loadbac3()])
                    .spread(function (pRow1, pRow2, pRow3) {
                        var vm = {
                            layoutModels: res.locals.layoutModels,
                            bac1: pRow1,
                            bac2: pRow2,
                            bac3: pRow3,
                            showError: true,
                            errorMsg: 'Có sản phẩm không được xóa danh mục'
                        }
                        res.render('Quản trị/quanlydanhsachdanhmuc', vm);
                    })
            }
            else {
                danhmuc.xoa(entity).then(function (aff) {
                    res.redirect('/quanlidanhmuc');
                })
            }
        })

});
module.exports = r;
