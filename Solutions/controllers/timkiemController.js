/**
 * Created by Qui on 6/24/2017.
 */
var express = require('express'),
    danhsachtimkiem = require('../models/timkiemRepo'),
    q = require('q');
var r = express.Router();


r.get('/', function(req, res) {

    var timKiem = req.query.timKiem;

    var rec_per_page = 7;
    var curPage = req.query.page ? req.query.page : 1;
    var offset = (curPage - 1) * rec_per_page;

    danhsachtimkiem.loadTrangTimKiem(req.query.timKiem, rec_per_page, offset)
        .then(function(data) {
            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = [];
            for (var i = 1; i <= number_of_pages; i++) {
                pages.push({
                    timKiemName:  req.query.timKiem,
                    pageValue: i,
                    isActive: i === +curPage
                });
            }

            res.render('Tìm kiếm/timkiemnew', {
                layoutModels: res.locals.layoutModels,
                productsTimKiem: data.list,
                isEmpty: data.total === 0,
                total: data.total,
                timKiemName: req.query.timKiem,
                sanphamyeuthich: req.session.sanphamyeuthich,

                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,

            });
            console.log(req.session.sanphamyeuthich);


        });
});
r.post('/', function(req, res) {

    var x = req.body.sanphamyeuthich;
    var sanpham = [];
    for (var i = 0; i < x.length; i++) {

        sanpham.push({
            idUser: req.session.user.id,
            idSanPham: x[i].slice(5, x[i].length)
        });
    }
    for(var i = 0; i < sanpham.length; i++)
    {
        var entity={
            idUser:sanpham[i].idUser,
            idSanPham:sanpham[i].idSanPham
        }
        danhsachtimkiem.them(entity).then(function (affe)
        {
        });
    }
    res.redirect('/');
});

r.get('/:id', function(req, res) {
    var timKiem = req.query.timKiem;
    var loai = req.params.id;
    var rec_per_page = 7;
    var curPage = req.query.page ? req.query.page : 1;
    var offset = (curPage - 1) * rec_per_page;

    danhsachtimkiem.loadTrangTimKiemSapXep(req.query.timKiem, req.params.id,  rec_per_page, offset)
        .then(function(data) {
            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = [];
            for (var i = 1; i <= number_of_pages; i++) {
                pages.push({
                    timKiemName:  req.query.timKiem,
                    pageValue: i,
                    isActive: i === +curPage
                });
            }

            res.render('Tìm kiếm/timkiemnew', {
                layoutModels: res.locals.layoutModels,
                productsTimKiem: data.list,
                isEmpty: data.total === 0,
                isSortMoney:req.params.id === "sortbymoneyasc",
                isSortTime:req.params.id === "sortbytimedesc",
                total: data.total,
                timKiemName: req.query.timKiem,
                sanphamyeuthich: req.session.sanphamyeuthich,

                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,

            });
            console.log(req.session.sanphamyeuthich);


        });
});
r.post('/:id', function(req, res) {

    var x = req.body.sanphamyeuthich;
    var sanpham = [];
    for (var i = 0; i < x.length; i++) {

        sanpham.push({
            idUser: req.session.user.id,
            idSanPham: x[i].slice(5, x[i].length)
        });
    }
    for(var i = 0; i < sanpham.length; i++)
    {
        var entity={
            idUser:sanpham[i].idUser,
            idSanPham:sanpham[i].idSanPham
        }
        danhsachtimkiem.them(entity).then(function (affe)
        {
        });
    }
    res.redirect('/');
});
module.exports = r;