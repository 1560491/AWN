/**
 * Created by MiM on 24/06/2017.
 */
//
//muốn hàm này được sử dụng bên ngoài có nghĩa là nó có thể gọi lại hàm này trong các page khác
//yêu cầu: đã có tài khoản mà đang đăng nhập--> chuyển trang thôi :)))
module.exports = function(req, res, next) {
    if (req.session.isLogged === true) {
        //nếu có tài khoản thì việc chuyển trang đi tới trang khác là 1 điều đương nhiên
        next();
    } else {
        var url = '/taikhoan/thoat?retUrl=' + req.originalUrl;
        //redirect chuyển hướng trang mình mong muốn
        res.redirect(url);
    }
};
