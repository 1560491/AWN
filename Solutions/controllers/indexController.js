/**
 * Created by MiM on 21/06/2017.
 */
var express = require('express'), //khai báo moulde express dưới dạng biến 
    index = require('../models/indexRepo'), //khai báo đường url dẫn đến bằng biến 
    q = require('q'); //xử lí callback hell
var r = express.Router(); //định tuyến


r.get('/', function(req, res) {
    //gửi yêu cầu lên server load hết yêu cầu bên dưới 
    q.all([index.loadbac2(), index.loadTop5SanPhamDauGia(), index.loadTop5GiaCaoNhat(), index.loadTop5SanPhamGanKetThuc(), index.loadLoaiSanPhamQuangCao(), index.loadSanPhamQuangCao()])
        .spread(function(pRow1, pRow2, pRow3, pRow4, pRow5, pRow6)
    {
        var vm = {
            //trả về file index
            layoutModels: res.locals.layoutModels,
            bac2:pRow1,
            top5sanphamdaugia: pRow2,
            top5sanphamgiacao: pRow3,
            top5sanphamganketthuc:pRow4,
            loaiSanPhamQuangCao:pRow5,
            sanPhamQuangCao:pRow6
        }
        //khi trả về file index thì nó sẽ gắn tham số tương ứng như trên hãy nhớ lại C# khi làm gì để gắn theo 
        //thứ tự nó sẽ phải gắn đúng biến thì nó mới xuất đúng kết quả
        //tương tự cái này cũng v
        //nó sẽ dẫn tới file index và file indexRePo.js
        //cái indexRePo.js là hàm xử lí từ database nó như là chuỗi trung gian để xử lí database
        //nó trong thư mục models
        res.render('index', vm);
    })
});

module.exports = r;
