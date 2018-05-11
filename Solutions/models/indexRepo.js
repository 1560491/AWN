/**
 * Created by MiM on 21/06/2017.
 */
var mustache = require('mustache'),
    q = require('q'),
    db = require('../fn/db');

exports.loadbac1 = function() {
    var d = q.defer();
    var sql = 'select * from loaisanpham1';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadbac2 = function() {
    var d = q.defer();

    var sql ='select * from loaisanpham2';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadbac3 = function() {
    var d = q.defer();
    var sql = 'select * from loaisanpham3';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadTop5SanPhamDauGia = function () {
    var d = q.defer();
    var sql = 'select idsanphamdaugia, sotien, sanpham.*, count(*) ' +
        'from chitietdaugia, sanpham ' +
        'WHERE idsanphamdaugia = sanpham.idSANPHAM AND sanpham.conhan = 1 GROUP BY idsanphamdaugia ORDER BY COUNT(*) DESC LIMIT 5';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadTop5GiaCaoNhat = function () {
    var d = q.defer();
    var sql = 'select sanpham.* from sanpham where sanpham.conhan = 1 ORDER BY sanpham.gia DESC LIMIT 5';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadTop5SanPhamGanKetThuc = function () {
    var d = q.defer();
    var sql = 'select sanpham.* from sanpham where sanpham.conhan = 1 ORDER BY sanpham.thoigiankethuc ASC LIMIT 5';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadLoaiSanPhamQuangCao = function()
{
    var d = q.defer();
    var sql = 'select loaisanpham1.*, COUNT(*) ' +
        'from sanpham, loaisanpham1, loaisanpham2, loaisanpham3 ' +
        'where sanpham.conhan = 1 AND loaisanpham1.idLOAISANPHAM1 = loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 AND loaisanpham2.idLOAISANPHAM2 = loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 AND loaisanpham3.idLOAISP3 = sanpham.LOAISANPHAM3_idLOAISP3 ' +
        'GROUP BY loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 ORDER BY COUNT(*) DESC LIMIT 5';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadSanPhamQuangCao = function()
{
    var d = q.defer();
    var sql = '(SELECT sanpham.hinhanh2,  sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1,loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 1 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) '+
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1, loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 2 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) '+
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1, loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 3 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1,loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 4 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1,loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 5 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1,loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 6 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1,loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 7 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1, loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 8 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1, loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 9 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ' +
        'UNION ALL ' +
        '(SELECT sanpham.hinhanh2, sanpham.tensanpham, sanpham.gia, sanpham.thoigiankethuc, loaisanpham1.idLOAISANPHAM1, sanpham.idSANPHAM ' +
        'from sanpham, loaisanpham2, loaisanpham1, loaisanpham3 ' +
        'where sanpham.LOAISANPHAM3_idLOAISP3 = loaisanpham3.idLOAISP3 AND loaisanpham3.LOAISANPHAM2_idLOAISANPHAM2 = loaisanpham2.idLOAISANPHAM2 AND loaisanpham2.LOAISANPHAM1_idLOAISANPHAM1 = loaisanpham1.idLOAISANPHAM1 AND loaisanpham1.idLOAISANPHAM1 = 10 AND sanpham.conhan = 1 ' +
        'ORDER BY sanpham.thoigiankethuc ASC LIMIT 6) ';
    d.resolve(db.load(sql));
    return d.promise;
}
