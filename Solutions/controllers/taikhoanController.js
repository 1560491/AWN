
var express = require('express'),
    taikhoan = require('../models/taikhoanRepo'),
    restrict=require('../middle-wares/retricts'),
    q = require('q');
var crypto = require('crypto');
var moment = require('moment');

var taikhoanr = express.Router();
var hbs=require('nodemailer-express-handlebars');
var yeucau=require('../models/yeucauRepo');
var nodemailer=require('nodemailer');
//nodemailer dùng để xác nhận mail, thường thì có 2tham số là chính nhưng đây có tới 4 tham số
var transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true, // secure:true for port 465, secure:false for port 587
    auth: {
        user: 'daugiangao',
        pass: 'phuc11296'
    }
});

//taikhoanr là route đến /dangki  render page  theo địa chỉ đường dẫn đăng kí/dangki
//kiểu như taikhoanr  nắm giữ cái /  được gọi là root của cội nguồn :))
// nhưng mà nó lại nằm trong folder view @@ cái này phải xem lại
taikhoanr.get('/dangky', function(req, res) {
    res.render('Đăng ký/dangky', {
        layoutModels: res.locals.layoutModels,
        showError: false,
        errorMsg: ''
    });
});

taikhoanr.get('/dangnhap', function(req, res) {
    res.render('Đăng nhập/dangnhap');
});
taikhoanr.post('/dangky',function(req, res){
    var ePWD = crypto.createHash('md5').update(req.body.rawPWD).digest('hex');
    var nDOB = moment(req.body.datepicker, 'DD/MM/YYYY').format('YYYY-MM-DDTHH:mm');

    var entity = {
        username: req.body.tendangnhap,
        pass: ePWD,
        hoten: req.body.hoten,
        email: req.body.email,
        datepicker: nDOB,
        gioitinh: req.body.gioitinh,
        sdt: req.body.sdt,
        diachi: req.body.dc,
        ngay: 0,
        chucvu: 0,
        xacthuc:0
    };
    q.all([taikhoan.loadten(entity), taikhoan.loadmail(entity)])
        .spread(function(pRow1, pRow2)
        {
            var vm = {
                khongten:pRow1.length===0,
                khongmail: pRow2.length===0
            }
            if(vm.khongten===true)
            {
                if(vm.khongmail===false)
                {
                    var a={
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Email đã tồn tại'
                    }
                    res.render('Đăng ký/dangky',a);
                }
            }
            if(vm.khongten===false)
            {
                a={
                    layoutModels: res.locals.layoutModels,
                    showError: true,
                    errorMsg: 'Tên đăng nhập đã tồn tại'
                }
                res.render('Đăng ký/dangky',a);
            }
            if(vm.khongten===true && vm.khongmail===true) {
                transporter.use('compile',hbs({
                    viewPath:'views',
                    extName:'.hbs'
                }))
                transporter.sendMail({
                    from:'daugiangao@gmail.com',
                    to: entity.email,
                    subject:'Quản lý đấu giá team ngáo',
                    template:'Đăng ký/mail',
                    context:{
                        ten:entity.username
                    }
                },function (err) {
                    if(err){console.log('that bai')}
                    else
                    {console.log('thanhcong')}
                })


                taikhoan.dangky(entity).then(function (insertId) {
                    var b= {
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Đăng ký thành công.Mời bạn vào email để xác thực'
                    }
                    res.render('Đăng ký/dangky',b);
                });

            }
        })

});
taikhoanr.get('/xacthuc/:ten', function(req, res) {
    var entity={
        tendangnhap:req.params.ten,
        xacthuc:1
    }
    taikhoan.xacthuc(entity)
        .then(function(xacthuc) {
            res.redirect('/taikhoan/thanhcong');
        })
});
taikhoanr.get('/thanhcong', function(req, res) {
    var b={
        layout:false
    }
    res.render('Đăng ký/thanhcong',b);
});
taikhoanr.post('/dangnhap', function(req, res) {

    var ePWD = crypto.createHash('md5').update(req.body.rawPWD).digest('hex');
    var entity = {
        username: req.body.username,
        pass: ePWD
    };
    taikhoan.login(entity)
        .then(function(user) {
            if (user === null) {
                res.render('Đăng nhập/dangnhap', {
                    layoutModels: res.locals.layoutModels,
                    showError: true,
                    errorMsg: 'Thông tin đăng nhập không đúng.'
                });
            } else {
                if (user.xacthuc === 0) {
                    res.render('Đăng nhập/dangnhap', {
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Tài khoản chưa được xác thực'
                    });
                }
                else {
                    if (user.chucvu === 1) {
                        req.session.isQL = true;
                    }
                    if (user.chucvu === 0) {
                        req.session.isQL = false;
                    }
                    req.session.isLogged = true;
                    req.session.user = user;
                    var url = '/';
                    if (req.query.retUrl) {
                        url = req.query.retUrl;
                    }
                    var entity1={
                        id:user.id
                    }
                    q.all([taikhoan.diemtot(entity1),taikhoan.diemxau(entity1)])
                        .spread(function(diemtot,diemxau)
                        {
                            var x=diemtot.Count/(diemtot.Count+diemxau.Count)*100;
                            x = parseFloat(x).toFixed(2);
                            if(x<79)
                            {
                                req.session.isBan=false;
                            }
                            if(x>=79){
                                req.session.isBan=true;
                            }
                            req.session.diem = x;
                            res.redirect('/');

                        })

                }
            }
        });
});
taikhoanr.post('/thoat', restrict, function(req, res) {
    req.session.isLogged = false;
    req.session.user = null;
    req.session.cookie.expires = new Date(Date.now() - 1000);
   // res.redirect(req.headers.referer);
    res.redirect('/');
    //req.session.cart = null;
});
taikhoanr.get('/thoat', restrict, function(req, res) {
    req.session.isLogged = false;
    req.session.user = null;
    req.session.cookie.expires = new Date(Date.now() - 1000);
    // res.redirect(req.headers.referer);
    res.redirect('/');
    //req.session.cart = null;
});
taikhoanr.post('/resetmatkhau', function(req, res) {
    if(req.session.isLogged===true)
    {
        if(req.session.isQL===true)
        {
            var passkhoiphuc = crypto.createHash('md5').update('123456').digest('hex');
            var entity=
                {
                    pass:passkhoiphuc,
                    idUSER:req.body.idUSER
                }
            taikhoan.khoiphucmatkhau(entity).then(function(affectedRows) {
                res.redirect('/quanliuser');
            })
        }
        else{
            res.redirect('/');
        }
    }
    else {
        res.redirect('/taikhoan/dangnhap');
    }

});
taikhoanr.post('/xoauser', function(req, res) {
    if(req.session.isLogged===true) {
        if (req.session.isQL === true) {
            var entity =
                {
                    idUSER: req.body.idUSER
                }
            console.log(entity);
            taikhoan.xoanguoidung(entity).then(function (affectedRows) {
                res.redirect('/quanliuser');
            })
        }
        else{
            res.redirect('/');
        }
    }
    else {
        res.redirect('/taikhoan/dangnhap');
    }

});

taikhoanr.get('/thongtincanhan', function(req, res) {
    if(req.session.isLogged===true)
    {
        var entity={
            id:req.session.user.id
        }
        q.all([taikhoan.diemtot(entity),taikhoan.diemxau(entity),])
            .spread(function(diemtot,diemxau)
            {
                var x=diemtot.Count/(diemtot.Count+diemxau.Count)*100;
                x = parseFloat(x).toFixed(0);
                var vm = {
                    layoutModels: res.locals.layoutModels,
                    diemt:diemtot,
                    diemx:diemxau,
                    diemtincay:x,
                }
                res.render('Tài khoản/thongtincanhannew',vm);
            })

    }
    else{
        res.redirect('/')
    }
});
taikhoanr.get('/thaydoithongtin', function(req, res) {
    if(req.session.isLogged===true)
    {
        res.render('Tài khoản/thaydoithongtincanhan');
    }
    else{
        res.redirect('/')
    }
});
taikhoanr.post('/thaydoithongtin', function(req, res) {
    if(req.session.isLogged===true) {
        var ePWD = crypto.createHash('md5').update(req.body.passRW).digest('hex');
        var nDOB = moment(req.body.datepicker, 'DD/MM/YYYY').format('DD/MM/YYYY');
        var nDOB1 = moment(req.body.datepicker, 'DD/MM/YYYY').format('YYYY-MM-DDTHH:mm');

        var entity = {
            id: req.session.user.id,
            username: req.session.user.username,
            pass: ePWD,
            name: req.body.hoten,
            email: req.body.email,
            ngaysinh: nDOB,
            gioitinh: req.body.gioitinh,
            sdt: req.body.sdt,
            diachi: req.body.diachi,
        };
        var entity1 = {
            id: req.session.user.id,
            username: req.session.user.username,
            pass: ePWD,
            name: req.body.hoten,
            email: req.body.email,
            ngaysinh:nDOB1,
            gioitinh: req.body.gioitinh,
            sdt: req.body.sdt,
            diachi: req.body.diachi,
        };
        q.all([taikhoan.login(entity)])
            .spread(function (user) {
                if (user === null) {
                    res.render('Tài khoản/thaydoithongtincanhan', {
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Mật khẩu không chính xác'
                    });
                } else {
                    req.session.user = entity;
                    taikhoan.doithongtin(entity1).then(function (rows) {
                        res.redirect('/taikhoan/thongtincanhan');
                    })
                }
            });
    }
});
taikhoanr.get('/chitietdanhgia', function(req, res) {
    var entity={
        id:req.session.user.id
    }
    taikhoan.loadchitiet(entity).then(function (rows) {
        var vm={
            chitiet:rows,
        }
        console.log(vm);
        res.render('Tài khoản/chitietdanhgianew',vm);
    })

});
taikhoanr.get('/doimatkhau', function(req, res) {
    if(req.session.isLogged===true)
    {res.render('Đăng nhập/doimatkhau');}
    else {
        res.redirect('/taikhoan/dangnhap');
    }

});
taikhoanr.post('/doimatkhau', function(req, res) {
    if(req.session.isLogged===true) {
        var ePWD = crypto.createHash('md5').update(req.body.pass).digest('hex');
        var ePWD1 = crypto.createHash('md5').update(req.body.passcu).digest('hex');
        var entity1 = {
            pass: ePWD,
            idUSER: req.session.user.id
        }
        var entity = {
            username: req.session.user.username,
            pass: ePWD1,
        };
        q.all([taikhoan.login(entity)])
            .spread(function (user) {
                if (user === null) {
                    res.render('Đăng nhập/doimatkhau', {
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Mật khẩu không chính xác'
                    });
                } else {
                    taikhoan.doimatkhau(entity1).then(function (affectedRows) {
                        res.redirect('/taikhoan/thoat');
                    });
                }
            });
    }
    else {
        res.redirect('/taikhoan/dangnhap');
    }
});
taikhoanr.get('/matkhau', function(req, res) {
    res.render('Đăng nhập/resetmatkhau');
});
taikhoanr.post('/matkhau', function(req, res) {
        var entity = {
            email:req.body.email
        };
        q.all([taikhoan.kiemtramail(entity)])
            .spread(function (user) {
                if (user === null) {
                    res.render('Đăng nhập/resetmatkhau', {
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Email chưa dùng để đăng ký tài khoản'
                    });
                } else {
                    transporter.use('compile',hbs({
                        viewPath:'views',
                        extName:'.hbs'
                    }))
                    transporter.sendMail({
                        from:'daugiangao@gmail.com',
                        to: entity.email,
                        subject:'Quản lý đấu giá team ngáo',
                        template:'Đăng nhập/mailrs',
                        context:{
                            id:user.id,
                            hoten:user.name
                        }
                    },function (err) {
                        if(err){console.log('that bai')}
                        else
                        {console.log('thanhcong')}
                    })

                    res.render('Đăng nhập/resetmatkhau', {
                        layoutModels: res.locals.layoutModels,
                        showError: true,
                        errorMsg: 'Mời quý khách vào email để đặt lại mật khẩu'
                    });
                }
            });
});
taikhoanr.get('/reset/:id', function(req, res) {
    res.render('Đăng nhập/matkhau');
});
taikhoanr.post('/reset/:id', function(req, res) {
        var ePWD = crypto.createHash('md5').update(req.body.pass).digest('hex');
        var entity = {
            pass: ePWD,
            idUSER: req.params.id
        }
    taikhoan.doimatkhau(entity).then(function (affectedRows) {
        var vm={
            layout:false
        }
        res.render('Đăng nhập/thanhcongrs',vm);
    });
});
taikhoanr.get('/xinphep', function(req, res) {
    res.render('Tài khoản/donxinphep');
});
taikhoanr.post('/xinphep', function(req, res) {
    var date=new Date();
    var thoigian = moment(date).format('YYYY-MM-DD HH:mm:ss');
    var a={
        id:req.session.user.id,
        comment: req.body.comment,
        thoigian:thoigian
    }
    console.log(a);
    yeucau.xinphep(a).then(function (rows) {
        res.redirect('/taikhoan/thongtincanhan');
    })
});
taikhoanr.get('/daugiathang',function (req,res) {
    var entity={
        id:req.session.user.id
    }

    q.all([taikhoan.loadspdaugiathang(entity)]).spread(function (rows) {
        var vm={
            sanphamthang:rows,
            NoProduct:rows.length==0
        }
        var a={
            idsp:req.query.idsp,
            idnguoiduoc:req.query.iduser,
            idcomment:req.session.user.id,
            noidung:req.query.comment,
            diem:req.query.optradio
        }
        taikhoan.comment(a).then(function (asd) {
        })
        res.render('Tài khoản/sanphamdaugiathangnew',vm);

    })

});
taikhoanr.get('/splike', function(req, res) {
    res.render('Tài khoản/sanphamyeuthichnew');
});
module.exports = taikhoanr;

