var express = require('express'),
    handlebars = require('express-handlebars'),
    handlebars_sections = require('express-handlebars-sections'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    path = require('path'),
    wnumb = require('wnumb'),
    handle404 = require('./middle-wares/handle-404'),
    handleLayout=require('./middle-wares/handleLayout'),
    index= require('./controllers/indexController'),
    quanlinguoidung=require('./controllers/danhsachnguoidungController'),
    yeucau=require('./controllers/yeucauController'),
    huongdan=require('./controllers/huongdanController'),
    timkiem = require('./controllers/timkiemController'),
    danhsachdanhmuc=require('./controllers/quanlydanhmucController'),
    sanpham = require('./controllers/sanphamController'),
    dangbanController = require('./controllers/dangbanController'),
    taikhoan=require('./controllers/taikhoanController'),
    quanlisanphamtaikhoan = require('./controllers/quanlisanphamcanhanController');


var request = require('request');
var session = require('express-session');
// var fileStore = require('session-file-store')(session);
var MySQLStore = require('express-mysql-session')(session);

var app = express();

app.use(morgan('dev')); //morgan tạo ra log các request đến server
app.use(session({ //session lưu trữ trạng thái cho trang
    secret: 'Z7X7gXzoKBT8h18jwXBEP4T0kJ8=',
    resave: false,
    saveUninitialized: true,
    // store: new fileStore()
    store: new MySQLStore({
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '',
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
// app.engine('hbs', handlebars({
//     extname: 'hbs',
//     defaultLayout: 'main',
//     layoutsDir: 'views/_layouts/',
//      helpers: {
//          section: handlebars_sections(),
//          number_format: function (n) {
//              var nf = wnumb({
//                  thousand: ','
//              });
//              return nf.to(n) + " VNĐ";
//          },
//          number_format1: function (n) {
//              var nf = wnumb({
//                  thousand: ','
//              });
//              return nf.to(n) + " Đ";
//          }
//      }
// }));
app.set('view engine', 'html');

app.use(express.static(
    path.resolve(__dirname, 'public')
));

app.use(bodyParser.json()); //req về bằng định dạng json
app.use(bodyParser.urlencoded({
    extended: false
}));
//format route đến các trang 
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
//mở port cho web
app.listen(3000,function () {
    console.log('listening port 3000 !');
});
