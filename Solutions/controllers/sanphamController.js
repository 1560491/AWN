var express = require('express'), //khai báo moudlde 
    product = require('../models/sanphamRepo'), //khai báo đường dẫn
    q = require('q'),// module xử lí callback hell
taikhoan=require('../models/taikhoanRepo'); // khai báo đường dẫn
var moment = require('moment'); //khai báo module
var productController = express.Router(); //route
//nghĩa của cái này là get link từng sản phẩm bằng id của nó
productController.get('/:id', function(req, res) {
    //nó sẽ dẫn tới trang sanphamloai/id 
    var rec_per_page = 10; // đây là số giới hạn 10 sản phẩm trong 1 trang
    var curPage = req.query.page ? req.query.page : 1; 
    //quyết định giá trị nào được gán cho curPage
    var offset = (curPage - 1) * rec_per_page;
    // loadTrangBac1 truyền vào ID  bất kì, giới hạn là 10,
    //offset ở đây là số lượng tất cả các sản phẩm
    product.loadTrangBac1(req.params.id, rec_per_page, offset)
        .then(function(data) {
            //cái này xác định 2 cái
            //1 là chia hết để lấy các trang đủ 10 sản phẩm
            //2 là chia phần dư: phần dư còn lại để trong 1 trang khác
            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) { // phải lấy total để chia vì v nó mới ra đc
                number_of_pages++;
            }

            var pages = []; //tạo ra 1 mảng tên là page
            for (var i = 1; i <= number_of_pages; i++) { //đếm số page ở trên vừa xử lí
                // đẩy vào cái mảng
                pages.push({
                    //gồm 2 thành phần: giá trị page
                    //đang hoạt động ở trang nào 
                    pageValue: i,
                    isActive: i === +curPage
                });
            }
            if(req.session.user == null)
            {
                res.render('Nhóm sản phẩm/nhom_san_pham_bac1', {
                    layoutModels: res.locals.layoutModels,
                    productsBac1: data.list,
                    isEmpty: data.total === 0,
                    catId: req.params.id,
                    catName: data.name,
                    nameBac2: data.nameBac2,
                    sanphamyeuthich: req.session.sanphamyeuthich,

                    pages: pages,
                    curPage: curPage,
                    prevPage: curPage - 1,
                    nextPage: curPage + 1,
                    showPrevPage: curPage > 1,
                    showNextPage: curPage < number_of_pages - 1,

                });
            }
            else {
                res.render('Nhóm sản phẩm/nhom_san_pham_bac1', {
                    layoutModels: res.locals.layoutModels,
                    productsBac1: data.list,
                    isEmpty: data.total === 0,
                    catId: req.params.id,
                    catName: data.name,
                    nameBac2: data.nameBac2,
                    idDangNhap: req.session.user.id,
                    sanphamyeuthich: req.session.sanphamyeuthich,
                    pages: pages,
                    curPage: curPage,
                    prevPage: curPage - 1,
                    nextPage: curPage + 1,
                    showPrevPage: curPage > 1,
                    showNextPage: curPage < number_of_pages - 1,

                });
            }



        });
});
productController.post('/:id', function(req, res) {
    var id = req.query.id;
    var x = req.body.sanphamyeuthich;
    var sanpham = [];
    for (var i = 0; i < x.length; i++) {

        sanpham.push({
            idUser: req.session.user.id,
            idSanPham: x[i].slice(5, x[i].length)
        });
    }
    for(var i = 0; i < sanpham.length; i++)
    {
        var entity={
            idUser:sanpham[i].idUser,
            idSanPham:sanpham[i].idSanPham
        }
        product.them(entity).then(function (affe)
        {
        });
    }
    res.redirect('/');

});
productController.get('/sanphamloai2/:id', function(req, res) {

    var rec_per_page = 10;
    var curPage = req.query.page ? req.query.page : 1;
    var offset = (curPage - 1) * rec_per_page;

    product.loadTrangBac2(req.params.id, rec_per_page, offset)
        .then(function(data) {

            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = [];
            for (var i = 1; i <= number_of_pages; i++) {
                pages.push({
                    pageValue: i,
                    isActive: i === +curPage
                });
            }

            res.render('Nhóm sản phẩm/nhom_san_pham_bac2', {
                layoutModels: res.locals.layoutModels,
                productsBac2: data.list,
                isEmpty: data.total === 0,
                catId: req.params.id,
                nameBac1: data.nameBac1,
                nameBac2: data.nameBac2,
                nameBac3: data.nameBac3,
                sanphamyeuthich: req.session.sanphamyeuthich,
                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,

            });

        });
});
productController.post('/sanphamloai2/:id', function(req, res) {
    var id = req.query.id;
    var x = req.body.sanphamyeuthich;
    var sanpham = [];
    for (var i = 0; i < x.length; i++) {

        sanpham.push({
            idUser: req.session.user.id,
            idSanPham: x[i].slice(5, x[i].length)
        });
    }
    for(var i = 0; i < sanpham.length; i++)
    {
        var entity={
            idUser:sanpham[i].idUser,
            idSanPham:sanpham[i].idSanPham
        }
        product.them(entity).then(function (affe)
        {
        });
    }
    res.redirect('/');

});
productController.get('/sanphamloai2/sanphamloai3/:id', function(req, res) {

    var rec_per_page = 10;
    var curPage = req.query.page ? req.query.page : 1;
    var offset = (curPage - 1) * rec_per_page;

    product.loadTrangBac3(req.params.id, rec_per_page, offset)
        .then(function(data) {

            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = [];
            for (var i = 1; i <= number_of_pages; i++) {
                pages.push({
                    pageValue: i,
                    isActive: i === +curPage
                });
            }

            res.render('Nhóm sản phẩm/nhom_san_pham_bac3', {
                layoutModels: res.locals.layoutModels,
                productsBac2: data.list,
                isEmpty: data.total === 0,
                catId: req.params.id,
                nameBac1: data.nameBac1,
                nameBac2: data.nameBac2,
                nameBac3: data.nameBac3,
                sanphamyeuthich: req.session.sanphamyeuthich,

                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,

            });

        });
});
productController.post('/sanphamloai2/sanphamloai3/:id', function(req, res) {
    var id = req.query.id;
    var x = req.body.sanphamyeuthich;
    var sanpham = [];
    for (var i = 0; i < x.length; i++) {

        sanpham.push({
            idUser: req.session.user.id,
            idSanPham: x[i].slice(5, x[i].length)
        });
    }
    for(var i = 0; i < sanpham.length; i++)
    {
        var entity={
            idUser:sanpham[i].idUser,
            idSanPham:sanpham[i].idSanPham
        }
        product.them(entity).then(function (affe)
        {
        });
    }
    res.redirect('/');

});
productController.get('/detail/:id', function(req, res) {
    q.all([ product.loadSanPham(req.params.id)])
        .spread(function(pro){
            var entity={
                id:pro.list.idnguoiban
            }
            q.all([taikhoan.loadchitiet(entity),taikhoan.diemtot(entity),taikhoan.diemxau(entity)]).spread(function (rows,tot,xau) {
                if (pro) {
                    if(req.session.user == null)
                    {
                        var x=tot.Count/(xau.Count+tot.Count)*100;
                        var a=pro.list.tienmax+pro.list.buocgia;
                        res.render('nhóm sản phẩm/sản phẩm chi tiết/chi_tiet_san_pham', {
                            layoutModels: res.locals.layoutModels,
                            product: pro.list,
                            isDauGiaNull: pro.list.userDauGia === null,
                            isGiaMuaLienNull: pro.list.giamualien === null,
                            chiTietDauGia: pro.chiTietDauGia,
                            chitiet:rows,
                            diemban:x,
                            bid:a
                        });
                    }
                    else {
                        var x=tot.Count/(xau.Count+tot.Count)*100;
                        var a=pro.list.buocgia+pro.list.tienmax;
                        res.render('nhóm sản phẩm/sản phẩm chi tiết/chi_tiet_san_pham', {
                            layoutModels: res.locals.layoutModels,
                            product: pro.list,
                            isNguoiBan: pro.list.idBan === req.session.user.id,
                            isDauGiaNull: pro.list.userDauGia === null,
                            isGiaMuaLienNull: pro.list.giamualien === null,
                            chiTietDauGia: pro.chiTietDauGia,
                            sanphamyeuthich: req.session.sanphamyeuthich,
                            chitiet:rows,
                            danhgia: req.session.diem,
                            diemban:x,
                            bid:a
                        });
                    }
                }

                else {
                    res.redirect('/');
                }
            })

        });

});
productController.post('/detail/:id', function(req, res) {
    var id = req.params.id;
    var l = req.body.sanphamyeuthich;
    if(l != null)
    {

        var entity={
            idUser:req.session.user.id,
            idSanPham:x.slice(5, l.length)
        }
        product.them(entity).then(function (affe)
        {
            res.redirect('/sanphamloai1/detail/' + id);
        });

    }
    else {
        var thoigian = moment(new Date()).format('YYYY-MM-DD HH:mm:ss');
        var bid_object =
        {
             x : req.body.tienbid,
             id : req.params.id,
             idUser : req.session.user.id,
            thoigian : thoigian
        }
        q.all([product.themchitiet(bid_object),product.loadluotdaugia(bid_object)])
            .spread(function (changedRows,rows) {
                var entity={
                    soluot:rows[0].soluotdaugia+1,
                    id : req.params.id
                }
console.log(entity);
                q.all([product.themluotdaugia(entity)]).then(function (changedRows) {
                    res.redirect(req.params.id);
                }).fail(function (err) {
                    console.log(err);
                    res.end('fail');})

            });
    }
});


module.exports = productController;