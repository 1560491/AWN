/**
 * Created by MiM on 22/06/2017.
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
    var sql = 'select * from loaisanpham2';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.loadbac3 = function() {
    var d = q.defer();
    var sql = 'select * from loaisanpham3 ';
    d.resolve(db.load(sql));
    return d.promise;
}
exports.them = function(entity) {
    var d = q.defer();
    var sql = mustache.render('INSERT INTO loaisanpham3(tensanpham,LOAISANPHAM2_idLOAISANPHAM2) VALUES ("{{ten}}","{{id2}}")',entity);
    d.resolve(db.insert(sql));
    return d.promise;
}
exports.loadbac3theoid = function(entity) {
    var d = q.defer();
    var sql=mustache.render('select * from loaisanpham3 where idLOAISP3="{{id}}"', entity);
    db.load(sql).then(function(rows) {
        d.resolve(rows[0]);
    });

    return d.promise;
}
exports.sua = function(entity) {
    var sql = mustache.render(
        'update loaisanpham3 set tensanpham = "{{ten}}" where idLOAISP3 = {{id}}',
        entity
    );

    return db.update(sql);
}

exports.xoa = function(entity) {
    var d = q.defer();
    var sql = mustache.render(
        'delete from loaisanpham3 where idLOAISP3 = {{id}}',
        entity
    );
    d.resolve(db.delete(sql));
    return d.promise;
}
exports.loadsanpham = function(entity) {
    var d = q.defer();
    var sql=mustache.render('select *from sanpham WHERE LOAISANPHAM3_idLOAISP3="{{id}}"', entity);
    db.load(sql).then(function(rows) {
        d.resolve(rows[0]);
    });

    return d.promise;
}
