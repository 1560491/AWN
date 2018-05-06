var mysql = require('mysql'),
//yêu cầu có moudle sql và khai báo nó 

    q = require('q'); // xử lí callback hell: xử lí bất đồng bộ quá nhiều 

//thiết lập chuỗi kết nối database 
//thông thường thì sẽ có 4 thông tin kết nối  như bên dưới
var _HOST = 'localhost',
    _USER = 'root',
    _PWD = '',
    _DB = 'qlbh';
// load này sẽ có 2 xử lí là load kiểu như select all database nếu đúng chuối kết nôi
//cái thứ 2 là truy vấn chúng
exports.load = function(sql) {

    var d = q.defer(); // defer trì hoãn việc xử lí bất đồng bộ cho tới khi hoàn thành hết
    //khi xử lí bất đồng bộ thì sẽ có trước sau
    //và dùng defer để trì hoãn  để đợi nó xủ lí xong hêt
    var connection = mysql.createConnection({
        host: _HOST,
        user: _USER,
        password: _PWD,
        database: _DB
    });
//khi có chuỗi kết nối thì chúng ta kết nối vào database
    connection.connect();// tạo kết nối tới dữ liệu

    connection.query(sql, function(error, rows, fields) {
        if (error)
            d.reject(error); //nếu có lỗi  phát sinh lỗi
            // throw error;
        

        d.resolve(rows); // cái này không chắc vì không dùng {}
        // nếu ko lỗi thì truy vấn từng dòng
    });

    connection.end();

    return d.promise; //thực hiện lời hứa của mình là gì :))) trong việc xử lí bất đồng bộ đã xong
}
// thêm dữ liệu vào database 
exports.insert = function(sql) {
    
    var d = q.defer(); // trì hoãn việc xử lí bất đồng bộ cho tới khi chúng hoàn thành hết
    //tạo chuối kết nối
    var connection = mysql.createConnection({
        host: _HOST,
        user: _USER,
        password: _PWD,
        database: _DB
    });
    //kết nối database
    connection.connect();
    //viết truy vấn 
    connection.query(sql, function(error, value) {
        if (error) {
            // throw error;
            d.reject(error); //từ chối truy vấn đưa ra lỗi
        } else {
            d.resolve(value.insertId);
            //cái hay là thêm theo iD
            //thêm dữ liệu vào db trong yêu cầu truy vấn
        }
    });

    connection.end();
    //đóng chuỗi kết nôi
    return d.promise;
    //thực hiện những gì đã hưa :))
}
//thực hiện truy vấn update db
exports.update = function(sql) {
    
    var d = q.defer();

    var connection = mysql.createConnection({
        host: _HOST,
        user: _USER,
        password: _PWD,
        database: _DB
    });

    connection.connect();

    connection.query(sql, function(error, value) {
        if (error) {
            d.reject(error);
        } else {
            d.resolve(value.changedRows);
            //thực hiện thay đổi theo dòng
        }
    });

    connection.end();

    return d.promise;
    //thực hiện những gì mình đã hứa những cái trên
}
//thực hiện truy vấn delete db
exports.delete = function(sql) {
    
    var d = q.defer(); //trì hoãn việc xử lí bất đồng bộ cho tới khi tất cả xử lí đã xong!

    var connection = mysql.createConnection({
        host: _HOST,
        user: _USER,
        password: _PWD,
        database: _DB
    });

    connection.connect();

    connection.query(sql, function(error, value) {
        //nhận 2 giá trị trả về là lỗi và giá trị cụ thể 
        if (error) {
            d.reject(error);
        } else {
            d.resolve(value.affectedRows);
            //trả về db còn lại sau khi xóa
        }
    });

    connection.end();

    return d.promise; //thực hiện hết những gì mình đã hứa trong hàm này :))
}