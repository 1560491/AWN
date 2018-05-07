/**
 * Created by Qui on 6/27/2017.
 */
var mustache = require('mustache'),
    q = require('q'),
    db = require('../fn/db');
var moment = require('moment');
exports.load = function() {
    var sql = 'select * from sanpham where tensanpham like "%HTC%"';
    return db.load(sql);
}



/* exports.load2 = function(catId) {
 var d = q.defer();
 var sql = 'select * from user, sanpham where sanpham.idnguoiban = user.idUSER and sanpham.tensanpham like "%htc%"';
 d.resolve(db.load(sql));
 return d.promise;
 }*/


exports.load = function() {
    var sql = 'select * from user';
    return db.load(sql);
}



exports.dangsanpham123 = function(entity) {

    console.log(entity);


    var d = new Date();



    //console.log(d.getYear() + '-' + d.getMonth() + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds());

    //var a = d.getYear() + '-' + d.getMonth() + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();


    var nDOB = moment(d, 'DD/MM/YYYY').format('YYYY-MM-DD HH:mm:ss');

    var a = moment(entity.thoigiandang, 'DD/MM/YYYY').format('YYYY-MM-DD HH:mm:ss');
    var b = moment(entity.thoigianketthuc, 'DD/MM/YYYY').format('YYYY-MM-DD HH:mm:ss');

    //console.log(a);
    //console.log(b);



    var sql = mustache.render(
        /*'INSERT into sanpham VALUES (null,{{chonloaisanpham}},"{{tensanpham}}","' + entity.motachitiet + '",null,{{giakhoidiem}},"' + entity.link1 + '","'+ entity.link2 +'","' + entity.link3 + '",{{giamuangay}},3,"2017-06-14 15:00:24","2017-06-14 15:00:24",3,150000,0,1)',*/
        'INSERT into sanpham VALUES (null,{{chonloaisanpham}},"{{tensanpham}}","'+ entity.motangangon+'","'+entity.motachitiet+'",{{giakhoidiem}},"'+entity.link1+'","'+entity.link2+'","'+entity.link3+'",{{giamuangay}},{{idnguoiban}},"'+a+'","'+b+'",3,150000,0,1,'+entity.tudonggiahan+')',
        /*'select * from user',*/
        entity
    );

    return db.insert(sql);
}