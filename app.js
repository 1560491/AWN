var express = require('express'), // Đưa thư viện thành 1 biến obj để truy xuất hàm và giá trị
    handlebars = require('express-handlebars'), // Tương tự với các module khác
    handlebars_sections = require('express-handlebars-sections'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    path = require('path'),
    wnumb = require('wnumb'),
    handle404 = require('./middle-wares/handle-404'), // Nạp các trang xử lý trung gian middle-wares
    handleLayout=require('./middle-wares/handleLayout'),
    index= require('./controllers/indexController'), // Nạp các hàm xử lý điều hướng. Dùng với  trang chủ index
    quanlinguoidung=require('./controllers/danhsachnguoidungController'), // Dùng cho trang người dùng
    yeucau=require('./controllers/yeucauController'), // Dùng cho trang yêu cầu bán của người dùng
    huongdan=require('./controllers/huongdanController'), // Cho trang hướng dẫn
    timkiem = require('./controllers/timkiemController'), // Trang tìm kiếm
    danhsachdanhmuc=require('./controllers/quanlydanhmucController'), // Trang quản lý
    sanpham = require('./controllers/sanphamController'), // Trang sp 
    dangbanController = require('./controllers/dangbanController'), // Trang đăng bán
    taikhoan=require('./controllers/taikhoanController'), // Trang tài khoản
    quanlisanphamtaikhoan = require('./controllers/quanlisanphamcanhanController'); // Trang sp cần han


var request = require('request'); // Chỉ là module
var session = require('express-session');
// var fileStore = require('session-file-store')(session);
var MySQLStore = require('express-mysql-session')(session);

var app = express();

app.use(morgan('dev')); // In ra màng hình các log CRUD lên console để dễ nhìn
//Ôn lại cách phiên hoạt động: 
//1. Phía user post acc, pass lên server
//2. Phía server sẽ tạo 1 SESSION ID gắn với user đó, sau đó lưu lại trên server và
// dán vào cookie và gửi về phía user
//3. Gỉa sửa có gián đoạn, phía user sẽ gửi lại lên phần cookie đó, nếu trùng với thông tin mà server lưu,
// server sẽ gửi lại thông tin đăng nhập cho user
//
app.use(session({ // Sử dụng session, có chuỗi secret bảo mật cho ID session
    secret: 'Z7X7gXzoKBT8h18jwXBEP4T0kJ8=',
    resave: false,
    saveUninitialized: true,
    // store: new fileStore()
    store: new MySQLStore({ // Nơi lưu trữ session
        host: 'localhost',
        port: 3306,
        user: 'francesco',
        password: 'some_pass',
        database: 'qlbh',
        createDatabaseTable: true,
        schema: {
            tableName: 'sessions',
            columnNames: {
                session_id: 'session_id',
                expires: 'expires',
                data: 'data'
            }
        }
    }),
}));
app.engine('hbs', handlebars({
    extname: 'hbs',
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
     helpers: {
         section: handlebars_sections(),
         number_format: function (n) {
             var nf = wnumb({
                 thousand: ','
             });
             return nf.to(n) + " VNĐ";
         },
         number_format1: function (n) {
             var nf = wnumb({
                 thousand: ','
             });
             return nf.to(n) + " Đ";
         }
     }
}));
app.set('view engine', 'hbs');

app.use(express.static(
    path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(handleLayout);
app.use('/', index);
app.use('/quanliuser',quanlinguoidung);
app.use('/quanliyeucau',yeucau);
app.use('/quanlidanhmuc',danhsachdanhmuc);
app.use('/timkiem', timkiem);
app.use('/huongdan',huongdan);
app.use('/sanphamloai1', sanpham);
app.use('/taikhoan',taikhoan);
app.use('/dangban',dangbanController);
app.use('/quanlisanphamtaikhoan',quanlisanphamtaikhoan);

app.use(handle404);

app.listen(3000,function () {
    console.log('Ahii');
});
