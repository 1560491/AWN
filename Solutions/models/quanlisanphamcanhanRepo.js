/**
 * Created by USER on 6/30/2017.
 */
var mustache = require('mustache'),
    q = require('q'),
    db = require('../fn/db');

exports.loadTrangSanPhamYeuThich = function(id, limit, offset) {

    var deferred = q.defer();

    var promises = [];

    var view = {
        idUser: id,
        limit: limit,
        offset: offset
    };


    var sqlCount = mustache.render('select count(*) as total ' +
        'from sanphamyeuthich  ' +
        'INNER JOIN sanpham on sanphamyeuthich.idsanpham = sanpham.idSANPHAM ' +
        'WHERE sanphamyeuthich.USER_idUSER = {{idUser}}', view);
    promises.push(db.load(sqlCount));

    var sql = mustache.render('select sanpham.*, sanphamyeuthich.*, d.tienmax, nguoiban.tendangnhap, GREATEST(IFNULL(tienmax, 0),sanpham.gia) as tiencaonhat ' +
        'from sanphamyeuthich  ' +
        'left outer join '+
        '(select *, max(sotien) as tienmax ' +
        'from chitietdaugia ' +
        'GROUP BY chitietdaugia.idsanphamdaugia) d on sanphamyeuthich.idsanpham = d.idsanphamdaugia  ' +
        'INNER JOIN sanpham on sanphamyeuthich.idsanpham = sanpham.idSANPHAM ' +
        'INNER JOIN user as nguoiban on sanpham.idnguoiban = nguoiban.idUSER  ' +
        'WHERE sanphamyeuthich.USER_idUSER  = {{idUser}} ' +
        'GROUP BY sanpham.idSANPHAM limit {{limit}} offset {{offset}}', view);
    promises.push(db.load(sql));



    q.all(promises).spread(function(totalRow, rows) {
        for(var i = 0; i < rows.length; i++)
        {

            if(rows[i].conhan[0] == 0)
            {
                rows[i].thoigiankethuc = "null";
            }

        }

        var data = {
            total: totalRow[0].total,
            list: rows,
        }


        deferred.resolve(data);
    });

    return deferred.promise;
}