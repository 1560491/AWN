/**
 * Created by USER on 6/30/2017.
 */
var express = require('express'), //khai báo moudle dưới dạng biến cái này tương tự như include iostream
    //nó gần như có tất cả xử lí cơ bản
    quanlisanpham = require('../models/quanlisanphamcanhanRepo'),
    //khai báo đường dẫn bằng 1 biến
    q = require('q'); //xử lí callback hell
var r = express.Router(); //định tuyến cho đúng đường thì dùng cái này như GPS :))

r.get('/sanphamyeuthich', function(req, res) {
 //gửi request về server có hiện parameter về sản phẩm yêu thích
 // mà trang này là trang nào nhỉ à nó trong tài khoản/ sanphamyeuthich nhé :)))


    var rec_per_page = 7; //khai báo biến bằng 7 ko biến làm gì nữa:))
    var curPage = req.query.page ? req.query.page : 1;
    //kiểu như sản phẩm thích xong nếu load lại thì .. ko biết còn tim nữa ko
    var offset = (curPage - 1) * rec_per_page;
 //kiểu như ko biết luôn à cái này dống như kiểu xử lí bên thời gian phản hồi trang tính theo persecon/page
    quanlisanpham.loadTrangSanPhamYeuThich(req.session.user.id, rec_per_page, offset)
        .then(function(data) {
            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = []; //khai báo 1 mảng
            for (var i = 1; i <= number_of_pages; i++) { //đi vòng lặp duyệt hết mảng
                pages.push({ //đẩy các dữ liệu vào mảng 
                    pageValue: i, //giá trị trang
                    isActive: i === +curPage //cái này giá trị gì ko biết luôn
                });
            }

            res.render('Tài khoản/sanphamyeuthichnew', { //trả ra trang sản phầm yêu thích nhất gòm các dữ liêu bên dưới 
                layoutModels: res.locals.layoutModels,
                productsYeuThich: data.list,
                isEmpty: data.total === 0,
                total: data.total,
                sanphamyeuthich: req.session.sanphamyeuthich,
                
                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                //curPage ở đây kiểu như là trang đang đứng 
                //có lẽ cái này là xử lí phân trang
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,

            });
            console.log(data.list); //hiện data bên terminal visual code :v
        });
});
module.exports = r;