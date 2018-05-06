//callback hell là xử lí bất đồng bộ trong nhiều hàm lồng nhau--> callback hell để giải quyết vấn đề ta sẽ dùng  moudle q
var q = require('q'), //xử lí callback hell cho function
    index = require('../models/indexRepo'), //tạo 1 biến mà biến đó giữ cái routing

    sanpham = require('../models/sanphamRepo'); //dống cái trên

   var  ac=require('../models/taikhoanRepo');//dống cái trên 
   //sử dụng biến "var" không biết làm gì nữa :))

module.exports = function(req, res, next) { 
    if(req.session.user == null)
    {
        //trả về trang ../models/indexRepo để load sản phẩm lên
        q.all([index.loadbac1(),index.loadbac2(),index.loadbac3()
            //spread tách 1 array thành nhiều phần tử
        ]).spread(function(cRows1,cRows2,cRows3) {
            res.locals.layoutModels = {
                //layoutModel kiểu như đây là 1 trạng thái trang kiểu như trang nền .
                bac1: cRows1,//kiểu như load sản phẩm bậc 1 trong trong 1 hàng
                bac2:cRows2, //tương tự
                bac3:cRows3,//tương tự
                isLogged: req.session.isLogged, //nơi lưu trữ tài khoản đăng nhập
                curUser: req.session.user, // ... user
                isQL: req.session.isQL, //... dữ liệu
                isBan:req.session.isBan, //.... các sản phẩm bán 
            };
            next();
            console.log(all);
        });
    }
    else
    {
           //trả về trang ../models/indexRepo để load sản phẩm lên được load thêm sản phẩm được yêu thích nhất
        q.all([index.loadbac1(),index.loadbac2(),index.loadbac3(), sanpham.loadSanPhamYeuThich(req.session.user.id)
        ]).spread(function(cRows1,cRows2,cRows3, pRow4) {
            req.session.sanphamyeuthich = pRow4;
            res.locals.layoutModels = {
                //layoutModel kiểu như đây là 1 trạng thái trang kiểu như trang nền .
                bac1: cRows1, //kiểu như load sản phẩm bậc 1 trong trong 1 hàng
                bac2:cRows2, //tương tự
                bac3:cRows3,
                isLogged: req.session.isLogged, // trạng thái đã login 
                curUser: req.session.user, //có tên user name
                isQL: req.session.isQL, // có dữ liệu
                isBan:req.session.isBan, //còn sản phầm để bán

            };
            next();
        });
    }


}
