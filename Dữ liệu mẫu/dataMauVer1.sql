SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `idCOMMENT` int(11) NOT NULL,
  `USER_idUSER(nguoicomment)` int(11) NOT NULL,
  `noidungcomment` varchar(300) DEFAULT NULL,
  `idnguoiduocomment` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCOMMENT`,`USER_idUSER(nguoicomment)`),
  KEY `fk_COMMENT_USER1_idx` (`USER_idUSER(nguoicomment)`),
  CONSTRAINT `fk_COMMENT_USER1` FOREIGN KEY (`USER_idUSER(nguoicomment)`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `chitietdaugia`
-- ----------------------------
DROP TABLE IF EXISTS `chitietdaugia`;
CREATE TABLE `chitietdaugia` (
  `idCHITIETDAUGIA` int(11) NOT NULL,
  `SANPHAM_idSANPHAM(idsanphamdaugia)` int(11) NOT NULL,
  `USER_idUSER(idnguoidaugia)` int(11) NOT NULL,
  `sotien` float DEFAULT NULL,
  `thoigiandaugia` datetime DEFAULT NULL,
  PRIMARY KEY (`idCHITIETDAUGIA`,`SANPHAM_idSANPHAM(idsanphamdaugia)`,`USER_idUSER(idnguoidaugia)`),
  KEY `fk_CHITIETDAUGIA_USER1_idx` (`USER_idUSER(idnguoidaugia)`),
  KEY `fk_CHITIETDAUGIA_SANPHAM1_idx` (`SANPHAM_idSANPHAM(idsanphamdaugia)`),
  CONSTRAINT `fk_CHITIETDAUGIA_SANPHAM1` FOREIGN KEY (`SANPHAM_idSANPHAM(idsanphamdaugia)`) REFERENCES `sanpham` (`idSANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CHITIETDAUGIA_USER1` FOREIGN KEY (`USER_idUSER(idnguoidaugia)`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chitietdaugia
-- ----------------------------

-- ----------------------------
-- Table structure for `donhang`
-- ----------------------------
DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang` (
  `idDONHANG` int(11) NOT NULL,
  `ngaytratien` datetime DEFAULT NULL,
  `kieuthanhtoan` varchar(45) DEFAULT NULL,
  `KHACHHANG_idKHACHHANG` int(11) NOT NULL,
  PRIMARY KEY (`idDONHANG`,`KHACHHANG_idKHACHHANG`),
  KEY `fk_DONHANG_KHACHHANG1_idx` (`KHACHHANG_idKHACHHANG`),
  CONSTRAINT `fk_DONHANG_KHACHHANG1` FOREIGN KEY (`KHACHHANG_idKHACHHANG`) REFERENCES `khachhang` (`idKHACHHANG`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of donhang
-- ----------------------------

-- ----------------------------
-- Table structure for `khachhang`
-- ----------------------------
DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE `khachhang` (
  `idKHACHHANG` int(11) NOT NULL,
  `hoten` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKHACHHANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of khachhang
-- ----------------------------

-- ----------------------------
-- Table structure for `loaisanpham1`
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham1`;
CREATE TABLE `loaisanpham1` (
  `idLOAISANPHAM1` int(11) NOT NULL,
  `tensanpham` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLOAISANPHAM1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loaisanpham1
-- ----------------------------
INSERT INTO `loaisanpham1` VALUES ('21001', 'Đồ điện tử và điện máy');
INSERT INTO `loaisanpham1` VALUES ('21002', 'Thời trang');
INSERT INTO `loaisanpham1` VALUES ('21003', 'Đồ hồ và đồ trang sức');
INSERT INTO `loaisanpham1` VALUES ('21004', 'Sức khỏe và làm đẹp');
INSERT INTO `loaisanpham1` VALUES ('21005', 'Nhà c ủa và đời sống');
INSERT INTO `loaisanpham1` VALUES ('21006', 'Thể thao');
INSERT INTO `loaisanpham1` VALUES ('21007', 'Giải trí và sở thích');
INSERT INTO `loaisanpham1` VALUES ('21008', 'Đồ cổ và đồ sửu tập');
INSERT INTO `loaisanpham1` VALUES ('21009', 'Ô tô xe máy xe đạp');
INSERT INTO `loaisanpham1` VALUES ('21010', 'Hàng tiêu dùng');

-- ----------------------------
-- Table structure for `loaisanpham2`
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham2`;
CREATE TABLE `loaisanpham2` (
  `idLOAISANPHAM2` int(11) NOT NULL,
  `tensanpham` varchar(50) DEFAULT NULL,
  `LOAISANPHAM1_idLOAISANPHAM1` int(11) NOT NULL,
  PRIMARY KEY (`idLOAISANPHAM2`,`LOAISANPHAM1_idLOAISANPHAM1`),
  KEY `fk_LOAISANPHAM2_LOAISANPHAM11_idx` (`LOAISANPHAM1_idLOAISANPHAM1`),
  CONSTRAINT `fk_LOAISANPHAM2_LOAISANPHAM11` FOREIGN KEY (`LOAISANPHAM1_idLOAISANPHAM1`) REFERENCES `loaisanpham1` (`idLOAISANPHAM1`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loaisanpham2
-- ----------------------------
INSERT INTO `loaisanpham2` VALUES ('22001', 'Điện thoại và phụ kiện', '21001');
INSERT INTO `loaisanpham2` VALUES ('22002', 'Máy quay phim và chụp ảnh', '21001');
INSERT INTO `loaisanpham2` VALUES ('22003', 'Máy tính và tablet', '21001');
INSERT INTO `loaisanpham2` VALUES ('22004', 'Thiết bị nghe nhìn', '21001');
INSERT INTO `loaisanpham2` VALUES ('22005', 'Máy văn phòng', '21001');
INSERT INTO `loaisanpham2` VALUES ('22006', 'Điện máy gia đình', '21001');
INSERT INTO `loaisanpham2` VALUES ('22011', 'Thời trang nam', '21002');
INSERT INTO `loaisanpham2` VALUES ('22012', 'Thời trang nữ', '21002');
INSERT INTO `loaisanpham2` VALUES ('22021', 'Trang sức', '21003');
INSERT INTO `loaisanpham2` VALUES ('22022', 'Đồng hồ nam', '21003');
INSERT INTO `loaisanpham2` VALUES ('22023', 'Đồng hồ nữ', '21003');
INSERT INTO `loaisanpham2` VALUES ('22031', 'Nước hoa', '21004');
INSERT INTO `loaisanpham2` VALUES ('22032', 'Mỹ phẩm Makeup', '21004');
INSERT INTO `loaisanpham2` VALUES ('22033', 'Mỹ phẩm chăm sóc cơ thể', '21004');
INSERT INTO `loaisanpham2` VALUES ('22034', 'Dụng cụ làm đẹp', '21004');
INSERT INTO `loaisanpham2` VALUES ('22035', 'Thực phẩm chức năng', '21004');
INSERT INTO `loaisanpham2` VALUES ('22041', 'Nội thất', '21005');
INSERT INTO `loaisanpham2` VALUES ('22042', 'Trang trí', '21005');
INSERT INTO `loaisanpham2` VALUES ('22043', 'Đồ thờ và phong thủy', '21005');
INSERT INTO `loaisanpham2` VALUES ('22051', 'Bóng đá', '21006');
INSERT INTO `loaisanpham2` VALUES ('22052', 'Tenis', '21006');
INSERT INTO `loaisanpham2` VALUES ('22053', 'Bơi lội', '21006');
INSERT INTO `loaisanpham2` VALUES ('22054', 'Máy tập thể thao', '21006');
INSERT INTO `loaisanpham2` VALUES ('22061', 'Đồ chơi và sở thích', '21007');
INSERT INTO `loaisanpham2` VALUES ('22062', 'Búp bê và gấu bông', '21007');
INSERT INTO `loaisanpham2` VALUES ('22063', 'Trò chơi video', '21007');
INSERT INTO `loaisanpham2` VALUES ('22071', 'Đồ cổ ', '21008');
INSERT INTO `loaisanpham2` VALUES ('22072', 'Nệm', '21008');
INSERT INTO `loaisanpham2` VALUES ('22073', 'Đồ sưu tập', '21008');
INSERT INTO `loaisanpham2` VALUES ('22074', 'Tiền xu và tiền giấy', '21008');
INSERT INTO `loaisanpham2` VALUES ('22081', 'Xe máy', '21009');
INSERT INTO `loaisanpham2` VALUES ('22082', 'Xe hơi', '21009');
INSERT INTO `loaisanpham2` VALUES ('22083', 'Xe đạp', '21009');
INSERT INTO `loaisanpham2` VALUES ('22084', 'Phụ tùng', '21009');
INSERT INTO `loaisanpham2` VALUES ('22085', 'Phụ kiện và trang trí', '21009');
INSERT INTO `loaisanpham2` VALUES ('22091', 'Chăm sóc cá nhân', '21010');
INSERT INTO `loaisanpham2` VALUES ('22092', 'Dụng  cụ gia đình', '21010');
INSERT INTO `loaisanpham2` VALUES ('22093', 'Dầu gội và sữa tăm', '21010');
INSERT INTO `loaisanpham2` VALUES ('22094', 'Hóa phẩm', '21010');
INSERT INTO `loaisanpham2` VALUES ('22095', 'Văn phòng phẩm', '21010');

-- ----------------------------
-- Table structure for `loaisanpham3`
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham3`;
CREATE TABLE `loaisanpham3` (
  `idLOAISP3` int(11) NOT NULL,
  `tensanpham` varchar(50) DEFAULT NULL,
  `LOAISANPHAM2_idLOAISANPHAM2` int(11) NOT NULL,
  PRIMARY KEY (`idLOAISP3`,`LOAISANPHAM2_idLOAISANPHAM2`),
  KEY `fk_LOAISANPHAM3_LOAISANPHAM21_idx` (`LOAISANPHAM2_idLOAISANPHAM2`),
  CONSTRAINT `fk_LOAISANPHAM3_LOAISANPHAM21` FOREIGN KEY (`LOAISANPHAM2_idLOAISANPHAM2`) REFERENCES `loaisanpham2` (`idLOAISANPHAM2`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loaisanpham3
-- ----------------------------
INSERT INTO `loaisanpham3` VALUES ('23001', 'Điện thoại', '22001');
INSERT INTO `loaisanpham3` VALUES ('23002', 'Pin và sạc', '22001');
INSERT INTO `loaisanpham3` VALUES ('23003', 'Phụ kiện', '22001');
INSERT INTO `loaisanpham3` VALUES ('23004', 'Máy chụp hình', '22002');
INSERT INTO `loaisanpham3` VALUES ('23005', 'Máy quay phim', '22002');
INSERT INTO `loaisanpham3` VALUES ('23006', 'Ống kính', '22002');
INSERT INTO `loaisanpham3` VALUES ('23007', 'Thẻ nhớ', '22002');
INSERT INTO `loaisanpham3` VALUES ('23008', 'Phụ kiện khác', '22002');
INSERT INTO `loaisanpham3` VALUES ('23009', 'Laptop và Netbook', '22003');
INSERT INTO `loaisanpham3` VALUES ('23011', 'Quần Jean - Kaki', '22011');
INSERT INTO `loaisanpham3` VALUES ('23012', 'Quần Short', '22011');
INSERT INTO `loaisanpham3` VALUES ('23013', 'Quần Tây', '22011');
INSERT INTO `loaisanpham3` VALUES ('23014', 'Áo thun', '22011');
INSERT INTO `loaisanpham3` VALUES ('23015', 'Áo sơ mi', '22011');
INSERT INTO `loaisanpham3` VALUES ('23016', 'Áo len - Áo khoác', '22011');
INSERT INTO `loaisanpham3` VALUES ('23017', 'Quần Jean - Kaki', '22012');
INSERT INTO `loaisanpham3` VALUES ('23018', 'Quần Short', '22012');
INSERT INTO `loaisanpham3` VALUES ('23019', 'Quần Tây', '22012');
INSERT INTO `loaisanpham3` VALUES ('23020', 'Áo thun', '22012');
INSERT INTO `loaisanpham3` VALUES ('23021', 'Áo sơ mi', '22012');
INSERT INTO `loaisanpham3` VALUES ('23022', 'Áo voan - Áo kiểu', '22012');
INSERT INTO `loaisanpham3` VALUES ('230010', 'Desktop - Máy tính bàn', '22003');
INSERT INTO `loaisanpham3` VALUES ('230011', 'Thiết bị mạng', '22003');
INSERT INTO `loaisanpham3` VALUES ('230012', 'Linh kiện máy tính', '22003');
INSERT INTO `loaisanpham3` VALUES ('230013', 'Ổ cứng di động', '22003');
INSERT INTO `loaisanpham3` VALUES ('230014', 'Dàn âm thanh- Karaoke', '22004');
INSERT INTO `loaisanpham3` VALUES ('230015', 'Tivi', '22004');
INSERT INTO `loaisanpham3` VALUES ('230016', 'Âm ly', '22004');
INSERT INTO `loaisanpham3` VALUES ('230017', 'Loa âm thanh', '22004');
INSERT INTO `loaisanpham3` VALUES ('230018', 'Tai phone', '22004');
INSERT INTO `loaisanpham3` VALUES ('230019', 'Máy chiếu - Màn hình', '22005');
INSERT INTO `loaisanpham3` VALUES ('230020', 'Máy in - Photocopy - Scan', '22005');
INSERT INTO `loaisanpham3` VALUES ('230021', 'Máy Fax', '22005');
INSERT INTO `loaisanpham3` VALUES ('230022', 'Lò vi sóng - Lò nướng', '22006');
INSERT INTO `loaisanpham3` VALUES ('230023', 'Bàn ủi', '22006');
INSERT INTO `loaisanpham3` VALUES ('230024', 'Quạt điện', '22006');
INSERT INTO `loaisanpham3` VALUES ('230025', 'Máy lọc nước', '22006');
INSERT INTO `loaisanpham3` VALUES ('230026', 'Thiết bị gia nhiệt nước', '22006');

-- ----------------------------
-- Table structure for `sanpham`
-- ----------------------------
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham` (
  `idSANPHAM` int(11) NOT NULL,
  `LOAISANPHAM3_idLOAISP3` int(11) NOT NULL,
  `tensanpham` varchar(50) DEFAULT NULL,
  `motasanphamngangon` varchar(100) DEFAULT NULL,
  `motasanphamfull` varchar(500) DEFAULT NULL,
  `gia` float DEFAULT NULL,
  `hinhanh` blob,
  `giamualien` float DEFAULT NULL,
  `USER_idUSER(idnguoiban)` int(11) NOT NULL,
  `thoigianbatdauban` datetime DEFAULT NULL,
  `thoigiankethuc` datetime DEFAULT NULL,
  `USER_idUSER1(idnguoithang)` int(11) NOT NULL,
  `buocgia` float DEFAULT NULL,
  `LOAISANPHAM3_LOAISANPHAM2_idLOAISANPHAM2` int(11) NOT NULL,
  PRIMARY KEY (`idSANPHAM`,`LOAISANPHAM3_idLOAISP3`,`USER_idUSER(idnguoiban)`,`USER_idUSER1(idnguoithang)`,`LOAISANPHAM3_LOAISANPHAM2_idLOAISANPHAM2`),
  KEY `fk_SANPHAM_USER1_idx` (`USER_idUSER(idnguoiban)`),
  KEY `fk_SANPHAM_USER2_idx` (`USER_idUSER1(idnguoithang)`),
  KEY `fk_SANPHAM_LOAISANPHAM31_idx` (`LOAISANPHAM3_idLOAISP3`,`LOAISANPHAM3_LOAISANPHAM2_idLOAISANPHAM2`),
  CONSTRAINT `fk_SANPHAM_LOAISANPHAM31` FOREIGN KEY (`LOAISANPHAM3_idLOAISP3`, `LOAISANPHAM3_LOAISANPHAM2_idLOAISANPHAM2`) REFERENCES `loaisanpham3` (`idLOAISP3`, `LOAISANPHAM2_idLOAISANPHAM2`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SANPHAM_USER1` FOREIGN KEY (`USER_idUSER(idnguoiban)`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SANPHAM_USER2` FOREIGN KEY (`USER_idUSER1(idnguoithang)`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanpham
-- ----------------------------

-- ----------------------------
-- Table structure for `sanphamconguoimua`
-- ----------------------------
DROP TABLE IF EXISTS `sanphamconguoimua`;
CREATE TABLE `sanphamconguoimua` (
  `idSANPHAMCONGUOIMUA` int(11) NOT NULL,
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSANPHAMCONGUOIMUA`,`USER_idUSER`),
  KEY `fk_SANPHAMCONGUOIMUA_USER1_idx` (`USER_idUSER`),
  CONSTRAINT `fk_SANPHAMCONGUOIMUA_USER1` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamconguoimua
-- ----------------------------

-- ----------------------------
-- Table structure for `sanphamconhan`
-- ----------------------------
DROP TABLE IF EXISTS `sanphamconhan`;
CREATE TABLE `sanphamconhan` (
  `idSANPHAMCONHAN` int(11) NOT NULL,
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSANPHAMCONHAN`,`USER_idUSER`),
  KEY `fk_SANPHAMCONHAN_USER1_idx` (`USER_idUSER`),
  CONSTRAINT `fk_SANPHAMCONHAN_USER1` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamconhan
-- ----------------------------

-- ----------------------------
-- Table structure for `sanphamdaugia`
-- ----------------------------
DROP TABLE IF EXISTS `sanphamdaugia`;
CREATE TABLE `sanphamdaugia` (
  `idSANPHAMDAUGIA` int(11) NOT NULL,
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSANPHAMDAUGIA`,`USER_idUSER`),
  KEY `fk_SANPHAMDAUGIA_USER1_idx` (`USER_idUSER`),
  CONSTRAINT `fk_SANPHAMDAUGIA_USER1` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamdaugia
-- ----------------------------

-- ----------------------------
-- Table structure for `sanphamdaugiathang`
-- ----------------------------
DROP TABLE IF EXISTS `sanphamdaugiathang`;
CREATE TABLE `sanphamdaugiathang` (
  `idSANPHAMDAUGIATHANG` int(11) NOT NULL,
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSANPHAMDAUGIATHANG`,`USER_idUSER`),
  KEY `fk_SANPHAMDAUGIATHANG_USER1_idx` (`USER_idUSER`),
  CONSTRAINT `fk_SANPHAMDAUGIATHANG_USER1` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamdaugiathang
-- ----------------------------

-- ----------------------------
-- Table structure for `sanphamyeuthich`
-- ----------------------------
DROP TABLE IF EXISTS `sanphamyeuthich`;
CREATE TABLE `sanphamyeuthich` (
  `idSANPHAMYEUTHICH` int(11) NOT NULL,
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSANPHAMYEUTHICH`,`USER_idUSER`),
  KEY `fk_SANPHAMYEUTHICH_USER_idx` (`USER_idUSER`),
  CONSTRAINT `fk_SANPHAMYEUTHICH_USER` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamyeuthich
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `idUSER` int(11) NOT NULL,
  `tendangnhap` varchar(30) DEFAULT NULL,
  `matkhau` varchar(30) DEFAULT NULL,
  `hoten` varchar(100) DEFAULT NULL,
  `gioitinh` varchar(5) DEFAULT NULL,
  `ngaysinh` datetime DEFAULT NULL,
  `sodienthoai` varchar(20) DEFAULT NULL,
  `diachi` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idUSER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;