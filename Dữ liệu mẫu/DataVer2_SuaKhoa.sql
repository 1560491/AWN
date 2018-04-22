SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chitietdaugia
-- ----------------------------
DROP TABLE IF EXISTS `chitietdaugia`;
CREATE TABLE `chitietdaugia` (
  `idsanphamdaugia` int(11) DEFAULT NULL,
  `idnguoidaugia` int(11) DEFAULT NULL,
  `sotien` float DEFAULT NULL,
  `thoigiandaugia` datetime DEFAULT NULL,
  KEY `fk_CHITIETDAUGIA_USER1_idx` (`idnguoidaugia`) USING BTREE,
  KEY `fk_CHITIETDAUGIA_SANPHAM1_idx` (`idsanphamdaugia`) USING BTREE,
  CONSTRAINT `fk_CHITIETDAUGIA_SANPHAM1` FOREIGN KEY (`idsanphamdaugia`) REFERENCES `sanpham` (`idSANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CHITIETDAUGIA_USER1` FOREIGN KEY (`idnguoidaugia`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chitietdaugia
-- ----------------------------

-- ----------------------------
-- Table structure for chitietxinban
-- ----------------------------
DROP TABLE IF EXISTS `chitietxinban`;
CREATE TABLE `chitietxinban` (
  `idUser` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `ketqua` bit(1) DEFAULT NULL,
  KEY `fk_Iduser` (`idUser`),
  CONSTRAINT `fk_Iduser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of chitietxinban
-- ----------------------------
INSERT INTO `chitietxinban` VALUES ('3', 'asdasdasd', '2017-06-15 00:00:00', '');
INSERT INTO `chitietxinban` VALUES ('2', 'dddddddd', '2017-06-21 15:39:30', '\0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `idnguoicomment` int(11) NOT NULL,
  `noidungcomment` varchar(3000) DEFAULT NULL,
  `idnguoiduocomment` int(11) NOT NULL,
  `diemdanhgia` int(11) DEFAULT NULL,
  KEY `fk_COMMENT_USER1_idx` (`idnguoicomment`) USING BTREE,
  KEY `fk_COMMENT_USER2` (`idnguoiduocomment`),
  CONSTRAINT `fk_COMMENT_USER1` FOREIGN KEY (`idnguoicomment`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMMENT_USER2` FOREIGN KEY (`idnguoiduocomment`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for loaisanpham1
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
INSERT INTO `loaisanpham1` VALUES ('1', 'Đồ điện tử và điện máy');
INSERT INTO `loaisanpham1` VALUES ('2', 'Thời trang');
INSERT INTO `loaisanpham1` VALUES ('3', 'Đồng hồ & đồ trang sức');
INSERT INTO `loaisanpham1` VALUES ('4', 'Sức khỏe& làm đẹp');
INSERT INTO `loaisanpham1` VALUES ('5', 'Nhà cửa & đời sống');
INSERT INTO `loaisanpham1` VALUES ('6', 'Thể thao');
INSERT INTO `loaisanpham1` VALUES ('7', 'Giải trí  & sở thích');
INSERT INTO `loaisanpham1` VALUES ('8', 'Đồ cổ &đồ sửu tập');
INSERT INTO `loaisanpham1` VALUES ('9', 'Ô tô xe máy xe đạp');
INSERT INTO `loaisanpham1` VALUES ('10', 'Hàng tiêu dùng');

-- ----------------------------
-- Table structure for loaisanpham2
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham2`;
CREATE TABLE `loaisanpham2` (
  `idLOAISANPHAM2` int(11) NOT NULL,
  `tensanpham` varchar(50) DEFAULT NULL,
  `LOAISANPHAM1_idLOAISANPHAM1` int(11) NOT NULL,
  PRIMARY KEY (`idLOAISANPHAM2`,`LOAISANPHAM1_idLOAISANPHAM1`),
  KEY `fk_LOAISANPHAM2_LOAISANPHAM11_idx` (`LOAISANPHAM1_idLOAISANPHAM1`),
  KEY `idLOAISANPHAM2` (`idLOAISANPHAM2`),
  CONSTRAINT `fk_LOAISANPHAM2_LOAISANPHAM11` FOREIGN KEY (`LOAISANPHAM1_idLOAISANPHAM1`) REFERENCES `loaisanpham1` (`idLOAISANPHAM1`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loaisanpham2
-- ----------------------------
INSERT INTO `loaisanpham2` VALUES ('1', 'Điện thoại và phụ kiện', '1');
INSERT INTO `loaisanpham2` VALUES ('2', 'Máy quay phim và chụp ảnh', '1');
INSERT INTO `loaisanpham2` VALUES ('3', 'Máy tính và tablet', '1');
INSERT INTO `loaisanpham2` VALUES ('4', 'Thiết bị nghe nhìn', '1');
INSERT INTO `loaisanpham2` VALUES ('5', 'Máy văn phòng', '1');
INSERT INTO `loaisanpham2` VALUES ('6', 'Điện máy gia đình', '1');
INSERT INTO `loaisanpham2` VALUES ('7', 'Thời trang nam', '2');
INSERT INTO `loaisanpham2` VALUES ('8', 'Thời trang nữ', '2');
INSERT INTO `loaisanpham2` VALUES ('9', 'Trang sức', '3');
INSERT INTO `loaisanpham2` VALUES ('10', 'Đồng hồ nam', '3');
INSERT INTO `loaisanpham2` VALUES ('11', 'Đồng hồ nữ', '3');
INSERT INTO `loaisanpham2` VALUES ('12', 'Nước hoa', '4');
INSERT INTO `loaisanpham2` VALUES ('13', 'Mỹ phẩm Makeup', '4');
INSERT INTO `loaisanpham2` VALUES ('14', 'Mỹ phẩm chăm sóc cơ thể', '4');
INSERT INTO `loaisanpham2` VALUES ('15', 'Dụng cụ làm đẹp', '4');
INSERT INTO `loaisanpham2` VALUES ('16', 'Thực phẩm chức năng', '4');
INSERT INTO `loaisanpham2` VALUES ('17', 'Nội thất', '5');
INSERT INTO `loaisanpham2` VALUES ('18', 'Trang trí', '5');
INSERT INTO `loaisanpham2` VALUES ('19', 'Đồ thờ và phong thủy', '5');
INSERT INTO `loaisanpham2` VALUES ('20', 'Bóng đá', '6');
INSERT INTO `loaisanpham2` VALUES ('21', 'Tenis', '6');
INSERT INTO `loaisanpham2` VALUES ('22', 'Bơi lội', '6');
INSERT INTO `loaisanpham2` VALUES ('23', 'Máy tập thể thao', '6');
INSERT INTO `loaisanpham2` VALUES ('24', 'Đồ chơi và sở thích', '7');
INSERT INTO `loaisanpham2` VALUES ('25', 'Búp bê và gấu bông', '7');
INSERT INTO `loaisanpham2` VALUES ('26', 'Trò chơi video', '7');
INSERT INTO `loaisanpham2` VALUES ('27', 'Đồ cổ ', '8');
INSERT INTO `loaisanpham2` VALUES ('28', 'Đồ sưu tập', '8');
INSERT INTO `loaisanpham2` VALUES ('29', 'Tiền xu và tiền giấy', '8');
INSERT INTO `loaisanpham2` VALUES ('30', 'Xe máy', '9');
INSERT INTO `loaisanpham2` VALUES ('31', 'Xe hơi', '9');
INSERT INTO `loaisanpham2` VALUES ('32', 'Xe đạp', '9');
INSERT INTO `loaisanpham2` VALUES ('33', 'Phụ tùng', '9');
INSERT INTO `loaisanpham2` VALUES ('34', 'Phụ kiện và trang trí', '9');
INSERT INTO `loaisanpham2` VALUES ('35', 'Chăm sóc cá nhân', '10');
INSERT INTO `loaisanpham2` VALUES ('36', 'Dụng  cụ gia đình', '10');
INSERT INTO `loaisanpham2` VALUES ('37', 'Dầu gội và sữa tăm', '10');
INSERT INTO `loaisanpham2` VALUES ('38', 'Hóa phẩm', '10');
INSERT INTO `loaisanpham2` VALUES ('39', 'Văn phòng phẩm', '10');

-- ----------------------------
-- Table structure for loaisanpham3
-- ----------------------------
DROP TABLE IF EXISTS `loaisanpham3`;
CREATE TABLE `loaisanpham3` (
  `idLOAISP3` int(11) NOT NULL AUTO_INCREMENT,
  `tensanpham` varchar(50) DEFAULT NULL,
  `LOAISANPHAM2_idLOAISANPHAM2` int(11) NOT NULL,
  PRIMARY KEY (`idLOAISP3`,`LOAISANPHAM2_idLOAISANPHAM2`),
  KEY `fk_LOAISANPHAM3_LOAISANPHAM21_idx` (`LOAISANPHAM2_idLOAISANPHAM2`),
  KEY `idLOAISP3` (`idLOAISP3`),
  CONSTRAINT `fk_LOAISANPHAM3_LOAISANPHAM21` FOREIGN KEY (`LOAISANPHAM2_idLOAISANPHAM2`) REFERENCES `loaisanpham2` (`idLOAISANPHAM2`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loaisanpham3
-- ----------------------------
INSERT INTO `loaisanpham3` VALUES ('1', 'Điện thoại', '1');
INSERT INTO `loaisanpham3` VALUES ('2', 'Pin và sạc', '1');
INSERT INTO `loaisanpham3` VALUES ('3', 'Phụ kiện', '1');
INSERT INTO `loaisanpham3` VALUES ('4', 'Máy chụp hình', '2');
INSERT INTO `loaisanpham3` VALUES ('5', 'Máy quay phim', '2');
INSERT INTO `loaisanpham3` VALUES ('6', 'Ống kính', '2');
INSERT INTO `loaisanpham3` VALUES ('7', 'Thẻ nhớ', '2');
INSERT INTO `loaisanpham3` VALUES ('8', 'Phụ kiện khác', '2');
INSERT INTO `loaisanpham3` VALUES ('9', 'Laptop & Netbook', '3');
INSERT INTO `loaisanpham3` VALUES ('10', 'Desktop-Máy tính để bàn', '3');
INSERT INTO `loaisanpham3` VALUES ('11', 'Thiết bị mạng', '3');
INSERT INTO `loaisanpham3` VALUES ('12', 'Linh kiện máy tính', '3');
INSERT INTO `loaisanpham3` VALUES ('13', 'Ổ cứng di động', '3');
INSERT INTO `loaisanpham3` VALUES ('14', 'Dàn âm thanh-Karaoke', '4');
INSERT INTO `loaisanpham3` VALUES ('15', 'Tivi', '4');
INSERT INTO `loaisanpham3` VALUES ('16', 'Âm ly', '4');
INSERT INTO `loaisanpham3` VALUES ('17', 'Loa âm thanh', '4');
INSERT INTO `loaisanpham3` VALUES ('18', 'Tai phone', '4');
INSERT INTO `loaisanpham3` VALUES ('19', 'Máy chiếu-Màn chiếu', '5');
INSERT INTO `loaisanpham3` VALUES ('20', 'Máy in-Photocopy-Scan', '5');
INSERT INTO `loaisanpham3` VALUES ('21', 'Máy Fax', '5');
INSERT INTO `loaisanpham3` VALUES ('22', 'Lò vi sóng-Lò nướng', '6');
INSERT INTO `loaisanpham3` VALUES ('23', 'Bàn ủi', '6');
INSERT INTO `loaisanpham3` VALUES ('24', 'Quạt điện', '6');
INSERT INTO `loaisanpham3` VALUES ('25', 'Máy lọc nước', '6');
INSERT INTO `loaisanpham3` VALUES ('26', 'Thiết bị gia nhiệt', '6');
INSERT INTO `loaisanpham3` VALUES ('27', 'Quần Jean-Kaki', '7');
INSERT INTO `loaisanpham3` VALUES ('28', 'Quần Short', '7');
INSERT INTO `loaisanpham3` VALUES ('29', 'Quần Tây', '7');
INSERT INTO `loaisanpham3` VALUES ('30', 'Áo thun', '7');
INSERT INTO `loaisanpham3` VALUES ('31', 'Áo sơ mi', '7');
INSERT INTO `loaisanpham3` VALUES ('32', 'Áo len-Áo khoác', '7');
INSERT INTO `loaisanpham3` VALUES ('33', 'Quần Jean-Kaki', '8');
INSERT INTO `loaisanpham3` VALUES ('34', 'Quần Short', '8');
INSERT INTO `loaisanpham3` VALUES ('35', 'Quần Tây', '8');
INSERT INTO `loaisanpham3` VALUES ('36', 'Áo thun', '8');
INSERT INTO `loaisanpham3` VALUES ('37', 'Áo sơ mi', '8');
INSERT INTO `loaisanpham3` VALUES ('38', 'Áo voan-Áo kiểu', '8');
INSERT INTO `loaisanpham3` VALUES ('39', 'Trang sức cổ', '9');
INSERT INTO `loaisanpham3` VALUES ('40', 'Trang sức hôn lễ', '9');
INSERT INTO `loaisanpham3` VALUES ('41', 'Trang sức cho trẻ', '9');
INSERT INTO `loaisanpham3` VALUES ('42', 'Trang sức thủ công', '9');
INSERT INTO `loaisanpham3` VALUES ('43', 'Nước hoa nam', '12');
INSERT INTO `loaisanpham3` VALUES ('44', 'Nước hoa nữ', '12');
INSERT INTO `loaisanpham3` VALUES ('45', 'Dành cho da', '13');
INSERT INTO `loaisanpham3` VALUES ('46', 'Danh cho mặt', '13');
INSERT INTO `loaisanpham3` VALUES ('47', 'Dành cho tóc', '13');
INSERT INTO `loaisanpham3` VALUES ('48', 'Dành cho da', '14');
INSERT INTO `loaisanpham3` VALUES ('49', 'Dành cho mặt', '14');
INSERT INTO `loaisanpham3` VALUES ('50', 'Dành cho tóc', '14');
INSERT INTO `loaisanpham3` VALUES ('51', 'Dụng cụ làm tóc', '15');
INSERT INTO `loaisanpham3` VALUES ('52', 'Dụng cụ chăm sóc da', '15');
INSERT INTO `loaisanpham3` VALUES ('53', 'Dụng cụ trang điểm', '15');
INSERT INTO `loaisanpham3` VALUES ('54', 'Bệnh xương khớp', '16');
INSERT INTO `loaisanpham3` VALUES ('55', 'Giảm cân', '16');
INSERT INTO `loaisanpham3` VALUES ('56', 'Bổ sung dinh dưỡng', '16');
INSERT INTO `loaisanpham3` VALUES ('57', 'Bộ Sofa', '17');
INSERT INTO `loaisanpham3` VALUES ('58', 'Giường', '17');
INSERT INTO `loaisanpham3` VALUES ('59', 'Bàn', '17');
INSERT INTO `loaisanpham3` VALUES ('60', 'Ghế', '17');
INSERT INTO `loaisanpham3` VALUES ('61', 'Tủ', '17');
INSERT INTO `loaisanpham3` VALUES ('62', 'Giày', '20');
INSERT INTO `loaisanpham3` VALUES ('63', 'Quần áo', '20');
INSERT INTO `loaisanpham3` VALUES ('64', 'Quả bóng', '20');
INSERT INTO `loaisanpham3` VALUES ('65', 'Vợt', '21');
INSERT INTO `loaisanpham3` VALUES ('66', 'Giày', '21');
INSERT INTO `loaisanpham3` VALUES ('67', 'Thời trang tennis', '21');
INSERT INTO `loaisanpham3` VALUES ('68', 'Đồ bơi nam', '22');
INSERT INTO `loaisanpham3` VALUES ('69', 'Đồ bơi nữ', '22');
INSERT INTO `loaisanpham3` VALUES ('70', 'Kính bơi', '22');
INSERT INTO `loaisanpham3` VALUES ('71', 'Máy tập chạy bộ', '23');
INSERT INTO `loaisanpham3` VALUES ('72', 'Máy tập đạp xe', '23');
INSERT INTO `loaisanpham3` VALUES ('73', 'Máy tập đa năng', '23');
INSERT INTO `loaisanpham3` VALUES ('74', 'Máy tập giảm eo', '23');
INSERT INTO `loaisanpham3` VALUES ('75', 'Xe mô hình', '24');
INSERT INTO `loaisanpham3` VALUES ('76', 'Đồ chơi giáo dục', '24');
INSERT INTO `loaisanpham3` VALUES ('77', 'Đồ chơi xây dựng', '24');
INSERT INTO `loaisanpham3` VALUES ('78', 'Búp bê', '25');
INSERT INTO `loaisanpham3` VALUES ('79', 'Gấu bông', '25');
INSERT INTO `loaisanpham3` VALUES ('80', 'Búp bê giấy', '25');
INSERT INTO `loaisanpham3` VALUES ('81', 'Trò chơi', '26');
INSERT INTO `loaisanpham3` VALUES ('82', 'Thẻ chơi game', '26');
INSERT INTO `loaisanpham3` VALUES ('83', 'Bộ phụ kiện', '26');
INSERT INTO `loaisanpham3` VALUES ('84', 'Sách bán thảo cổ', '27');
INSERT INTO `loaisanpham3` VALUES ('85', 'Nhạc cụ cổ', '27');
INSERT INTO `loaisanpham3` VALUES ('86', 'Tivi', '28');
INSERT INTO `loaisanpham3` VALUES ('87', 'Đồng hồ', '28');
INSERT INTO `loaisanpham3` VALUES ('88', 'Máy quay đĩa', '28');
INSERT INTO `loaisanpham3` VALUES ('89', 'Tiền xu cổ', '29');
INSERT INTO `loaisanpham3` VALUES ('90', 'Tiền giấy thế giới', '29');
INSERT INTO `loaisanpham3` VALUES ('91', 'Xe máy', '30');
INSERT INTO `loaisanpham3` VALUES ('92', 'Xe máy điện', '30');
INSERT INTO `loaisanpham3` VALUES ('93', 'Xe máy phân khối lớn', '30');
INSERT INTO `loaisanpham3` VALUES ('94', 'Phụ tùng xe máy', '30');
INSERT INTO `loaisanpham3` VALUES ('95', 'Xe tải', '31');
INSERT INTO `loaisanpham3` VALUES ('96', 'Xe hơi', '31');
INSERT INTO `loaisanpham3` VALUES ('97', 'Xe khách', '31');
INSERT INTO `loaisanpham3` VALUES ('98', 'Xe cũ', '31');
INSERT INTO `loaisanpham3` VALUES ('99', 'Xe đạp', '32');
INSERT INTO `loaisanpham3` VALUES ('100', 'Xe đạp cũ', '32');
INSERT INTO `loaisanpham3` VALUES ('101', 'Xe đạp điện', '32');
INSERT INTO `loaisanpham3` VALUES ('102', 'Xe đạp trẻ em', '32');
INSERT INTO `loaisanpham3` VALUES ('103', 'Lốp xe', '33');
INSERT INTO `loaisanpham3` VALUES ('104', 'Dầu nhớt', '33');
INSERT INTO `loaisanpham3` VALUES ('105', 'Xe đạp', '34');
INSERT INTO `loaisanpham3` VALUES ('106', 'Xe máy', '34');
INSERT INTO `loaisanpham3` VALUES ('107', 'Xe hơi', '34');
INSERT INTO `loaisanpham3` VALUES ('108', 'Vệ sinh nam', '35');
INSERT INTO `loaisanpham3` VALUES ('109', 'Vệ sinh nữ', '35');
INSERT INTO `loaisanpham3` VALUES ('110', 'Chăm sóc răng miệng', '35');
INSERT INTO `loaisanpham3` VALUES ('111', 'Dụng cụ vệ sinh', '36');
INSERT INTO `loaisanpham3` VALUES ('112', 'Dụng cụ nhà bếp', '36');
INSERT INTO `loaisanpham3` VALUES ('113', 'Dụng cụ ăn uống', '36');
INSERT INTO `loaisanpham3` VALUES ('114', 'Dầu gội', '37');
INSERT INTO `loaisanpham3` VALUES ('115', 'Sữa tắm', '37');
INSERT INTO `loaisanpham3` VALUES ('116', 'Nước tẩy rủa-lau sàn', '38');
INSERT INTO `loaisanpham3` VALUES ('117', 'Diệt côn trùng', '38');
INSERT INTO `loaisanpham3` VALUES ('118', 'Nước hoa xịt phòng', '38');
INSERT INTO `loaisanpham3` VALUES ('119', 'Bút ky-Viết', '39');
INSERT INTO `loaisanpham3` VALUES ('120', 'Giấy vở', '39');
INSERT INTO `loaisanpham3` VALUES ('121', 'Dụng cụ bấm', '39');
INSERT INTO `loaisanpham3` VALUES ('122', 'Dụng cụ cắt gọt', '39');

-- ----------------------------
-- Table structure for nguoichan
-- ----------------------------
DROP TABLE IF EXISTS `nguoichan`;
CREATE TABLE `nguoichan` (
  `idNguoichan` int(11) DEFAULT NULL,
  `idSanpham` int(11) DEFAULT NULL,
  KEY `fk_CHANNGUOI_USER` (`idNguoichan`),
  KEY `fk_CHANNGUOI_SANPHAM` (`idSanpham`),
  CONSTRAINT `fk_CHANNGUOI_SANPHAM` FOREIGN KEY (`idSanpham`) REFERENCES `sanpham` (`idSANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CHANNGUOI_USER` FOREIGN KEY (`idNguoichan`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nguoichan
-- ----------------------------

-- ----------------------------
-- Table structure for sanpham
-- ----------------------------
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham` (
  `idSANPHAM` int(11) NOT NULL AUTO_INCREMENT,
  `LOAISANPHAM2_idLOAISP2` int(11) DEFAULT NULL,
  `LOAISANPHAM3_idLOAISP3` int(11) NOT NULL,
  `tensanpham` varchar(100) DEFAULT NULL,
  `motasanphamngangon` varchar(1000) DEFAULT NULL,
  `motasanphamfull` varchar(3000) DEFAULT NULL,
  `gia` float DEFAULT NULL,
  `hinhanh` varchar(0) DEFAULT NULL,
  `giamualien` float DEFAULT NULL,
  `idnguoiban` int(11) NOT NULL,
  `thoigianbatdauban` datetime DEFAULT NULL,
  `thoigiankethuc` datetime DEFAULT NULL,
  `idnguoithang` int(11) NOT NULL,
  `buocgia` float DEFAULT NULL,
  PRIMARY KEY (`idSANPHAM`,`LOAISANPHAM3_idLOAISP3`,`idnguoiban`,`idnguoithang`),
  KEY `fk_SANPHAM_USER1_idx` (`idnguoiban`) USING BTREE,
  KEY `fk_SANPHAM_USER2_idx` (`idnguoithang`) USING BTREE,
  KEY `fk_SanphamLoai3` (`LOAISANPHAM3_idLOAISP3`),
  KEY `idSANPHAM` (`idSANPHAM`),
  KEY `fk_SanphamLoai2` (`LOAISANPHAM2_idLOAISP2`),
  CONSTRAINT `fk_SanphamLoai2` FOREIGN KEY (`LOAISANPHAM2_idLOAISP2`) REFERENCES `loaisanpham2` (`idLOAISANPHAM2`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_SanphamLoai3` FOREIGN KEY (`LOAISANPHAM3_idLOAISP3`) REFERENCES `loaisanpham3` (`idLOAISP3`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_SANPHAM_USER1` FOREIGN KEY (`idnguoiban`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_SANPHAM_USER2` FOREIGN KEY (`idnguoithang`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanpham
-- ----------------------------
INSERT INTO `sanpham` VALUES ('1', '1', '1', 'HTC One A9 16GB', '<ul>\r\n	<li>Màn hình:AMOLED 16 triệu màu, 5.0\", 1080 x 1920 pixels</li>\r\n	<li>Camera sau:13 MP, Quay phim FullHD 1080p@30fps</li>\r\n	<li>Camera trước:4 Ultra pixel</li>\r\n	<li>Hệ điều hành:Android 6.0 (Marshmallow)</li>\r\n	<li>CPU:Qualcomm Snapdragon 617, 8 nhân, 1.5 GHz</li>\r\n	<li>Chip đồ hoạ:Adreno 405</li>\r\n	<li>RAM:2 GB</li>\r\n	<li>Bộ nhớ trong:16 GB</li>\r\n	<li>Hỗ trợ thẻ tối đa:2 TB</li>\r\n	<li>Số khe SIM:1 Sim, Nano SIM</li>\r\n	<li>Dung lượng pin:2150 mAh</li>\r\n	<li>Kết nối:Wi-Fi hotspot, Wi-Fi 802.11 a/b/g/n/ac, Dual-band</li>\r\n</ul>', '<ul>\r\n	<li>Màn hình:AMOLED 16 triệu màu, 5.0\", 1080 x 1920 pixels</li>\r\n	<li>Camera sau:13 MP, Quay phim FullHD 1080p@30fps</li>\r\n	<li>Camera trước:4 Ultra pixel</li>\r\n	<li>Hệ điều hành:Android 6.0 (Marshmallow)</li>\r\n	<li>CPU:Qualcomm Snapdragon 617, 8 nhân, 1.5 GHz</li>\r\n	<li>Chip đồ hoạ:Adreno 405</li>\r\n	<li>RAM:2 GB</li>\r\n	<li>Bộ nhớ trong:16 GB</li>\r\n	<li>Hỗ trợ thẻ tối đa:2 TB</li>\r\n	<li>Số khe SIM:1 Sim, Nano SIM</li>\r\n	<li>Dung lượng pin:2150 mAh</li>\r\n	<li>Kết nối:Wi-Fi hotspot, Wi-Fi 802.11 a/b/g/n/ac, Dual-band</li>\r\n</ul>', '11390000', null, '1200000', '1', '2017-06-14 15:00:24', '2017-06-18 15:00:26', '2', '100000');
INSERT INTO `sanpham` VALUES ('2', '1', '1', 'HTC ONE M10 32GB', 'Kích cỡ màn hình: Super LCD5; 5.2\" Quad HD 1440 x 2560 pixels (~565 ppi); Corning Gorilla Glass 4\r\nBộ nhớ trong: 32 GB\r\nRAM: 4 GB\r\nKhe cắm thẻ nhớ: Hỗ trợ thẻ nhớ MicroSD lên đến 2 TB\r\nCamera chính: 12MP \r\nCamera phụ: 5MP\r\nHệ điều hành: Android™ 6 với HTC Sense\r\nBộ xử lý: Lõi tứ; 64bit; xung nhịp lên đến 2.2GHz\r\nChipset: Qualcomm® Snapdragon™ 820; GPU: Adreno 530\r\nPin chuẩn: Li-Ion 3000mAh', '1. THIẾT KẾ:\r\n+ Với thiết kế đã trở nên nhàm chán của dòng sản phẩm cao cấp “One-Series” trong suốt 3 năm qua. HTC sẽ thổi một làn gió mới vào thiết kế mẫu sản phẩm chủ lực One M10 sắp được tung ra trong thời gian tới đây.\r\n+ Được biết, máy được thiết kế kính – kim loại thừa hưởng thiết kế dòng sản phẩm One A9 với vóc dáng mảnh mai và các góc cạnh cũng được bo cong mềm mại hơn. Nhằm tạo ra điểm nhấn, các cạnh mặt sau của One M10 đều sẽ được vát bằng cắt kim cương sắc nét.\r\n+ Yếu tố cấp tiến nhất trên 10 chính là mặt sau được vát cong để cầm vừa tay. Thứ bạn không thể thấy trên 10 chính là cặp loa phía trước đặc trưng của HTC. Thay vào đó, 10 có loa tweeter ở và loa woofer đặt ở cạnh đáy thiết bị, mỗi loa lại có bộ khuếch đại riêng. Âm thanh phát ra từ 10 lớn, chất lượng, cạnh tranh được với các máy khác. Ngoài ra, HTC còn phát triển ứng dụng riêng cho phép bạn tùy biến đầu ra đến tai và tai nghe cụ thể.\r\n2. MÀN HÌNH:\r\nMàn hình Quad HD 5.2 inch sáng và sắc nét. 10 còn có máy quét vân tay đặt dưới màn hình để mở khóa cũng như xác thực, các nút bấm khác như âm lượng, nút nguồn, cảm ứng điện dung đều hoạt động tốt như bạn mong đợi.\r\n3. CẤU HÌNH:\r\n+ Về cấu hình, One M10 chắc chắn sẽ được cung cấp những thông số mạnh mẽ nhất hiện tại. Bên trong của HTC 10 quen thuộc với bất kỳ ai đang dùng điện thoại cao cấp: chip Snapdragon 820, RAM 4GB, bộ nhớ 32GB có thể mở rộng qua thẻ nhớ microSD. Đặc biệt, camera mặt sau của máy sẽ được cải tiến cực kỳ mạnh mẽ với độ phân giải 12MP theo công nghệ Ultrapixel. Camera trước cũng hỗ trợ Ultrapixel nhưng độ phân giải kém hơn với 5MP.\r\n+ Ngoài ra, cảm biến nhận diện vân tay, giao diện Sense 8.0 được tối ưu và mượt mà hơn. Nó là thiết bị nhanh và nhạy: các ứng dụng mở nhanh chóng, không có độ trễ đáng kể. HTC tiết lộ đã tối ưu hóa cả phần cứng lẫn phần mềm để cải thiện phản hồi chạm, hiệu suất thực tế của máy chứng tỏ nỗ lực của HTC đã được đền đáp.\r\n4. PHẦN MỀM:\r\n+ Có lẽ phần ấn tượng nhất của 10 đến từ phần mềm. Khi các model cũ của HTC thường bị than phiền vì các ứng dụng giống nhau, giao diện nặng nề, kỳ lạ, 10 lại chỉ dùng 1 trình duyệt, 1 ứng dụng lịch, 1 ứng dụng nhạc… HTC nỗ lực thiết kế ứng dụng riêng theo ngôn ngữ thiết kế Material Design của Google.\r\n+ HTC tùy biến giao diện nhiều để không thể bị phân biệt với các phiênbản Android khác mà Google đang cài trên Nexus. Nó dễ nhìn, dễ dùng và bạn đang dùng Nexus rồi chuyển sang 10, bạn sẽ không hề bị bỡ ngỡ mà dễ chịu hơn nhiều. Chúng khiến trải nghiệm 10 trở nên thống nhất hơn mọi điện thoại Android khác. Sự tuân thủ triệt để hướng dẫn của Google của HTC làm cho người dùng không có cảm giác đang sử dụng phần mềm do hai nhóm khác nhau phát triển khi luân chuyển giữa các ứng dụng.\r\n+ Nếu muốn tùy chỉnh giao diện, tính năng chủ đề của HTC đã được mở rộng với sticker và phong cách tự do, cho phép bạn đặt các widget và shortcut vào bất kỳ đâu trên màn hình thay vì bị giới hạn trong một lưới.\r\n6. CAMERA:\r\n+ Camera trên 10 cũng là một tính năng quen thuộc. Máy dùng cảm', '13490000', null, '1400000', '2', '2017-06-19 15:01:47', '2017-06-23 15:01:51', '1', '100000');
INSERT INTO `sanpham` VALUES ('3', '1', '1', 'iPhone 6 Plus', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD\r\nHệ điều hành:	iOS 9\r\nCamera sau:	8 MP\r\nCamera trước:	1.2 MP\r\nCPU:	Apple A8 2 nhân 64-bit\r\nRAM:	1 GB\r\nBộ nhớ trong:	16 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM\r\nDung lượng pin:	2915 mAh', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD\r\nHệ điều hành:	iOS 9\r\nCamera sau:	8 MP\r\nCamera trước:	1.2 MP\r\nCPU:	Apple A8 2 nhân 64-bit\r\nRAM:	1 GB\r\nBộ nhớ trong:	16 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM\r\nDung lượng pin:	2915 mAh', '12000000', null, '1400000', '3', '2017-06-20 15:04:42', '2017-06-29 15:04:46', '2', '100000');
INSERT INTO `sanpham` VALUES ('4', '1', '1', 'iPhone 6s', 'Màn hình:	LED-backlit IPS LCD, 4.7\", Retina HD\r\nHệ điều hành:	iOS 9\r\nCamera sau:	12 MP\r\nCamera trước:	5 MP\r\nCPU:	Apple A9 2 nhân 64-bit\r\nRAM:	2 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM\r\nDung lượng pin:	1715 mAh', 'Màn hình:	LED-backlit IPS LCD, 4.7\", Retina HD\r\nHệ điều hành:	iOS 9\r\nCamera sau:	12 MP\r\nCamera trước:	5 MP\r\nCPU:	Apple A9 2 nhân 64-bit\r\nRAM:	2 GB\r\nBộ nhớ trong:	128 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM\r\nDung lượng pin:	1715 mAh', '18890000', null, '2000000', '2', '2017-06-13 15:06:04', '2017-06-18 15:06:08', '1', '100000');
INSERT INTO `sanpham` VALUES ('5', '1', '1', 'iPhone 7', 'Màn hình:	LED-backlit IPS LCD, 4.7\", Retina HD\r\nHệ điều hành:	iOS 10\r\nCamera sau:	12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\nRAM:	2 GB\r\nBộ nhớ trong:	256 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	1960 mAh', 'Màn hình:	LED-backlit IPS LCD, 4.7\", Retina HD\r\nHệ điều hành:	iOS 10\r\nCamera sau:	12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\nRAM:	2 GB\r\nBộ nhớ trong:	256 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	1960 mAh', '21990000', null, '2200000', '1', '2017-06-05 15:07:33', '2017-06-07 15:07:36', '2', '100000');
INSERT INTO `sanpham` VALUES ('6', '1', '1', 'iPhone 7 Plus', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD\r\nHệ điều hành:	iOS 10\r\nCamera sau:	Hai camera 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	256 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	2900 mAh', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD\r\nHệ điều hành:	iOS 10\r\nCamera sau:	Hai camera 12 MP\r\nCamera trước:	7 MP\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	256 GB\r\nThẻ nhớ:	Không\r\nThẻ SIM:	1 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	2900 mAh', '25990000', null, '2700000', '1', '2017-06-06 15:08:48', '2017-06-09 15:08:51', '2', '100000');
INSERT INTO `sanpham` VALUES ('7', '1', '1', 'Mobiistar Lai Yuna X', 'Màn hình: 5 inchs (720 x 1280 pixels) Camera: Chính: 13.0 MP, Phụ: 8.0 MP RAM: 2GB ROM: 16GB Hệ điều hành: Android 6 (Marshmallow) CPU: MT6737, 4 nhân 1.3GHz GPU: Mali-T720MP2 Thẻ nhớ: Hỗ trợ lên đến 32GB SIM: 2SIM, có 4G Pin: 2500mAh', 'Màn hình: 5 inchs (720 x 1280 pixels) Camera: Chính: 13.0 MP, Phụ: 8.0 MP RAM: 2GB ROM: 16GB Hệ điều hành: Android 6 (Marshmallow) CPU: MT6737, 4 nhân 1.3GHz GPU: Mali-T720MP2 Thẻ nhớ: Hỗ trợ lên đến 32GB SIM: 2SIM, có 4G Pin: 2500mAh', '1900000', null, '2300000', '3', '2017-06-13 15:10:29', '2017-06-16 15:10:32', '2', '100000');
INSERT INTO `sanpham` VALUES ('8', '1', '1', 'Mobiistar Prime X1', 'Màn hình : 5.5 inch (720 x 1280 pixels)\r\nCamera : Chính: 13.0 MP, Phụ: 8.0 MP\r\nRAM : 3 GB\r\nBộ nhớ trong : 16 GB\r\nHệ điều hành : Android 6.0 (Marshmallow)\r\nChipset : MTK MT6737\r\nCPU : Quad-Core Cortex A53 1.3GHz\r\nKích thước : 154.4 x 78.7 x 9.1mm\r\nGPU : Mali-T720MP2', 'Cấu hình Mobiistar Prime X1 vượt trội trong tầm giá \r\n\r\nMột trong những đặc điểm ưu điểm của Prime X1 là cấu hình của smartphone trong tầm giá. Prime X1 được nâng cấp lên RAM 3 GB, cùng với chip lõi tứ MT 6737, ROM 16 GB, pin 3000 mAh và cài sẵn nền tảng Android 6.0 Marshmallow, đáp ứng nhu cầu trải nghiệm làm việc, giải trí hiệu quả cả ngày dài.\r\n\r\n \r\n\r\nThiết kế Prime X1 nổi bật\r\n\r\nPrime X1 mang thiết kế nhôm nguyên khối thuần nhất, chắc chắn với các cạnh được bo cong mềm mại mang đến cảm giác thoải mái cho người dùng, kết hợp với sắc màu xu hướng, đem lại cảm giác sang trọng khi cầm trên tay. \r\n\r\n \r\n\r\nĐiện thoại Mobiistar Prime X1 sở hữu màn hình rộng rãi \r\n\r\nMáy có màn hình 5.5 inch HD IPS rộng rãi. Mặt kính cong 2,5D  xu hướng tạo nên sự liền mạch, trơn tru khi vuốt tay từ màn hình xuống cạnh, cho trải nghiệm thị giác sống động, mượt mà và đẹp mắt.\r\n\r\nCảm biến vân tay thời thượng \r\n\r\nVới người dùng phân khúc tầm trung, cảm biến vân tay vẫn còn là một tính năng lạ lẫm và đem lại nhiều trải nghiệm mới mẻ. Với nhiều ứng dụng hữu ích trong cuộc sống hằng ngày như: Bảo mật hiệu quả, chạm mở khoá ứng dụng nhanh chóng, chụp ảnh, tắt báo thức, chạm giữ cuộc gọi liền mạch. Cảm biến vân tay trên Prime X1 chắc chắn sẽ mang lại sự hài lòng cho bạn. \r\n\r\nCamera Prime X1 chất lượng \r\n\r\nPrime X1 sở hữu bộ đôi camera với độ phân giải lần lượt là 13 MP và 8 MP với nhiều ưu điểm nổi bật. Camera sau “mắt vàng” mang độ phân giải 13 MP, sở hữu cảm biến ISOCELL của Samsung, kết hợp với công nghệ tự động lấy nét theo pha và flash LED kép trợ sáng, ảnh chụp từ camera sau của Prime X1 trở nên chi tiết và trung thực trong nhiều điều kiện ánh sáng. Camera selfie được tích hợp chế độ “selfie 20” với tính năng “Làm đẹp gương mặt” giúp xoá mụn, nếp nhăn và làm da trắng hồng cho những bức ảnh thêm trẻ trung, rạng rỡ, dễ dàng giúp xây dựng hình ảnh bản thân trên mạng xã hội.', '3290000', null, '400000', '1', '2017-06-22 15:16:10', '2017-06-25 15:16:14', '3', '100000');
INSERT INTO `sanpham` VALUES ('9', '1', '1', 'Nokia Lumia 530 4GB', 'Camera sau (Megapixels)  5\r\nKích thước màn hình 4.0\r\nPhiên bản hệ điều hành Windows Phone 8.1\r\nDung lượng lưu trữ 4\r\nLoại pin 1430mAh\r\nTốc độ CPU (GHz) 1.20\r\nĐộ phân giải màn hình (pixels) 480 x 854 Pixels\r\nLoại màn hình FWVGA\r\nĐộ phân giải camera (MP) 5.0\r\nHỗ trợ thẻ nhớ 128GB', 'Nokia Lumia 530 là một đại diện mới từ bộ đôi Microsoft và Nokia hứa hẹn mang đến luồng gió mới cho thị trường điện thoại giá rẻ. Điện thoại Nokia Lumia 530 được cài đặt sẵn hệ điều hành Windows Phone 8.1, bên cạnh màn hình 4inch cùng nhiều cải tiến hơn so với đàn anh 520 hứa hẹn mang lại những trải nghiệm tốt hơn. Cũng với diện mạo trẻ trung và cá tính, đây sẽ là chiếc smartphone bạn không nên bỏ qua.\r\nTÍNH NĂNG NỔI BẬT\r\nTrẻ trung và lôi cuốn\r\nNokia Lumia 530 mang đến nét trẻ trung và sự khác biệt với lớp vỏ ngoài rực rỡ. Dù là màu xanh lá, hay màu cam, chiếc điện thoại  này vẫn tôn vinh nét cá tính của bạn. Dẫu cho màu sắc bạn lựa chọn không phù hợp với tâm trạng, bạn có thể dễ dàng chuyển sang một ốp lưng mới với màu sắc bạn yêu thích.\r\nNhiều tính năng mạnh mẽ\r\nSở hữu đầy đủ sức mạnh từ chip xử lý lõi tứ Qualcomm Snapdragon 200 1.2GHz và phiên bản Windows Phone mới nhất, Lumia 530 sẽ mang lại những trải nghiệm tuyệt vời hơn bất kể ứng dụng yêu thích nào. Dù bạn đang nhắn tin, lướt mạng xã hội hay chơi game, Nokia Lumia 530 luôn đủ khả năng để đáp ứng.\r\nLưu trữ mọi thứ trong cuộc sống của bạn\r\nKhông chỉ lưu trữ trên máy cùng bộ nhớ trong 4GB và khe cắm thẻ nhớ MicroSD hỗ trợ lên đến 128GB, ứng dụng OneDrive còn cho phép bạn thoải mái lưu trữ và đồng bộ các tập tin quan trọng của bạn trên nhiều thiết bị. Với 15GB dung lượng lưu trữ miễn phí, bạn sẽ luôn có đủ chỗ cho mọi thứ mình cần. Ngoài ra, Nokia Lumia 530  được cài sẵn ứng dụng Microsoft Office để bạn sẵn sàng giải quyết công việc ở bất kỳ nơi đâu.', '805000', null, '1000000', '1', '2017-06-20 15:17:53', '2017-06-22 15:17:56', '2', '100000');
INSERT INTO `sanpham` VALUES ('10', '1', '1', 'OPPO A37 (Neo 9)', 'Chipset: Qualcomm Snapdragon 410\r\nRAM: 2 GB\r\nROM: 16 GB\r\nOPPO A37 (hay còn gọi là OPPO Neo 9) là sản phẩm kế thừa sự thành công của Neo 7, với khung kim loại, mặt lưng giả kim và màn hình cong 2,5D được bảo vệ bởi kính cường lực Gorilla Glass 4. Ở phân khúc dưới 5 triệu đồng, đây là một thiết kế khá tốt khi so với những đối thủ trong tầm giá.\r\n', 'Thiết kế Oppo A37 cứng cáp với khung kim loại\r\n\r\nMàn hình : 5.0 inch (1280 x 720 pixels)\r\nCamera : Camera: Chính 8.0 MP, Phụ 5.0MP\r\nRAM : 2 GB\r\nBộ nhớ trong : 16 GB\r\nHệ điều hành : ColorOS 3.0(Android 5.1)\r\nChipset : Qualcomm Snapdragon 410\r\nCPU : Quad core 1.2 Ghz\r\nGPU : Adreno 306\r\nKích thước : 143.1 x 71 x 7.68 mm\r\n', '3290000', null, '4000000', '2', '2017-06-20 15:19:14', '2017-06-23 15:19:17', '1', '100000');
INSERT INTO `sanpham` VALUES ('11', '1', '1', 'OPPO F1s 2017 64GB', 'SKU	OP223ELAA2PSYWVNAMZ-4661401\r\nCamera Back	11-15MP\r\nCamera trước	7 MP trở lên\r\nScreen Size (inches)	5.5\r\nMẫu mã	OPPO F1s 2017 64GB\r\nNetwork Connections	4G - LTE\r\nHệ điều hành	Android\r\nOperating System Version	Lolipop\r\nKích thước sản phẩm (D x R x C cm)	15x0.6x0.6\r\nTrọng lượng (KG)	0.6', 'So với đời 2016, chiếc OPPO F1s 2017 nâng cấp hai thứ: RAM từ 3 GB lên thành 4 GB, bộ nhớ trong tăng từ 32 GB lên thành 64 GB. Giá của bản 2017 cũng cao hơn 1 triệu đồng so với bản 2016. Ở mức giá 6.990.000 này,  OPPO F1s 2017 có 2 thứ hợp lý cũng chính là RAM và ROM. Còn những thứ chưa hợp lý bao gồm chip MediaTek, Android 5.1 cũ kỹ và màn hình 720p.\r\nBộ nhớ 64 GB là rất dư dả nếu chỉ dùng để lưu ảnh chụp. Bạn có thể nghĩ đến việc lưu thêm nhiều thứ hơn trong chiếc điện thoại này ví dụ như phim, nhạc hoặc dùng điện thoại như là một cái USB di động để mang đến trường học hoặc công ty.\r\n​\r\nNgoại hình của OPPO F1s 2017 y hệt bản 2016. Máy chỉ có hai màu: Gold hoặc Rose Gold. Nếu bạn muốn có một lựa chọn trung lập và để sau này dễ bán lại thì buộc bạn phải chọn màu Gold hơn là Rose Gold. Màu Gold nhìn thực tế rất nhạt, có lúc lại khá giống với Rose Gold với tông màu hồng nhạt hơn. Hơi tiếc là OPPO F1s 2017 không có những màu cơ bản như Black hay Silver cho chúng ta dễ chọn. Cả hai màu của F1s đều hơi nữ tính.', '5200000', null, '6000000', '3', '2017-06-14 15:20:02', '2017-06-17 15:20:06', '1', '100000');
INSERT INTO `sanpham` VALUES ('12', '1', '1', 'Samsung A9 Pro 2016 32GB Ram 4GB', 'Nổi bật với kính cường lực 2.5D và khung kim loại cao cấp\r\nMàn hình: 6\", Full HD, Super AMOLED\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Snapdragon 652 8 nhân\r\nRAM: 4 GB, ROM: 32 GB\r\nCamera: 16 MP, Selfie: 8 MP - khẩu độ f1.9\r\nCảm biến vân tay\r\nPin 5.000mAh sạc nhanh\r\nKết nối Wifi,2G,3G,4G, Bluetooth,OTG\r\nXuất xứ: Việt Nam', 'Nổi bật với kính cường lực 2.5D và khung kim loại cao cấp\r\nMàn hình: 6\", Full HD, Super AMOLED\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Snapdragon 652 8 nhân\r\nRAM: 4 GB, ROM: 32 GB\r\nCamera: 16 MP, Selfie: 8 MP - khẩu độ f1.9\r\nCảm biến vân tay\r\nPin 5.000mAh sạc nhanh\r\nKết nối Wifi,2G,3G,4G, Bluetooth,OTG\r\nXuất xứ: Việt Nam', '7590000', null, '9000000', '1', '2017-06-14 15:26:08', '2017-06-15 15:26:12', '2', '100000');
INSERT INTO `sanpham` VALUES ('13', '1', '1', 'Samsung Galaxy A9 Pro', 'Màn hình:	Super AMOLED, 6\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	16 MP\r\nCamera trước:	8 MP\r\nCPU:	Qualcomm Snapdragon 652 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM\r\nDung lượng pin:	5000 mAh, có sạc nhanh', 'Màn hình:	Super AMOLED, 6\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	16 MP\r\nCamera trước:	8 MP\r\nCPU:	Qualcomm Snapdragon 652 8 nhân\r\nRAM:	4 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM\r\nDung lượng pin:	5000 mAh, có sạc nhanh', '10900000', null, '12000000', '2', '2017-06-22 15:27:16', '2017-06-22 15:27:20', '1', '100000');
INSERT INTO `sanpham` VALUES ('14', '1', '1', 'Samsung Galaxy C9 Pro', 'Màn hình:	Super AMOLED, 6\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	16 MP\r\nCamera trước:	16 MP\r\nCPU:	Snapdragon 653 8 nhân 64-bit\r\nRAM:	6 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	4000 mAh, có sạc nhanh', 'Màn hình:	Super AMOLED, 6\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	16 MP\r\nCamera trước:	16 MP\r\nCPU:	Snapdragon 653 8 nhân 64-bit\r\nRAM:	6 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	4000 mAh, có sạc nhanh', '11490000', null, '12000000', '1', '2017-06-14 15:29:57', '2017-06-15 15:30:01', '3', '100000');
INSERT INTO `sanpham` VALUES ('15', '1', '1', 'Samsung Galaxy J7 Prime', 'Màn hình:	Super AMOLED, 6\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	16 MP\r\nCamera trước:	16 MP\r\nCPU:	Snapdragon 653 8 nhân 64-bit\r\nRAM:	6 GB\r\nBộ nhớ trong:	64 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	4000 mAh, có sạc nhanhMàn hình:	PLS TFT LCD, 5.5\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	13 MP\r\nCamera trước:	8 MP\r\nCPU:	Exynos 7870 8 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM, hỗ trợ 4G\r\nMàn hình:	PLS TFT LCD, 5.5\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	13 MP\r\nCamera trước:	8 MP\r\nCPU:	Exynos 7870 8 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	3300 mAh', 'Màn hình:	PLS TFT LCD, 5.5\", Full HD\r\nHệ điều hành:	Android 6.0 (Marshmallow)\r\nCamera sau:	13 MP\r\nCamera trước:	8 MP\r\nCPU:	Exynos 7870 8 nhân 64-bit\r\nRAM:	3 GB\r\nBộ nhớ trong:	32 GB\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB\r\nThẻ SIM:	2 Nano SIM, hỗ trợ 4G\r\nDung lượng pin:	3300 mAh', '5900000', '', '7000000', '7', '2017-05-16 15:38:21', '2017-06-08 15:38:25', '8', '100000');
INSERT INTO `sanpham` VALUES ('16', '1', '1', 'Samsung Galaxy S7 Edge', 'Kiểu dáng: Vỏ hợp kim nguyên khối\r\nMàn hình: 5.1 inch (1440 x 2560 pixels)\r\nRAM: 4GB Bộ nhớ trong: 32GB\r\nHệ điều hành: Android 6.0 (Marshmallow)\r\nChipset: Qualcomm MSM8996 Snapdragon 820 GPU: Adreno 530\r\nCamera: Trước 5.0 MP; Sau: 12 MP\r\nDung lượng pin : Liion 3000 mAh 1 Nano SIM\r\nTính năng khác: Màn hình 2k; chống nước; bảo mật vân tay; sạc nhanh; sạc không dây tốc độ cao; hỗ trợ thẻ nhớ ngoài', 'Kiểu dáng: Vỏ hợp kim nguyên khối\r\nMàn hình: 5.1 inch (1440 x 2560 pixels)\r\nRAM: 4GB Bộ nhớ trong: 32GB\r\nHệ điều hành: Android 6.0 (Marshmallow)\r\nChipset: Qualcomm MSM8996 Snapdragon 820 GPU: Adreno 530\r\nCamera: Trước 5.0 MP; Sau: 12 MP\r\nDung lượng pin : Liion 3000 mAh 1 Nano SIM\r\nTính năng khác: Màn hình 2k; chống nước; bảo mật vân tay; sạc nhanh; sạc không dây tốc độ cao; hỗ trợ thẻ nhớ ngoài', '15490000', null, '17000000', '5', '2017-06-13 15:39:03', '2017-06-22 15:39:06', '4', '100000');
INSERT INTO `sanpham` VALUES ('17', '1', '1', 'Samsung Galaxy S8 64G Ram 4GB 5.8inch', 'Màn hình:	Super AMOLED, 5.8\", Quad HD (2K)\r\nHệ điều hành:	Android 7.0\r\nCamera sau:	12 MP\r\nCamera trước:	8 MP\r\nCPU:	Exynos 8895 8 nhân 64-bit\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB', 'Màn hình:	Super AMOLED, 5.8\", Quad HD (2K)\r\nHệ điều hành:	Android 7.0\r\nCamera sau:	12 MP\r\nCamera trước:	8 MP\r\nCPU:	Exynos 8895 8 nhân 64-bit\r\nRAM:	4 GB\r\nBộ nhớ trong:	64 GB', '18490000', null, '20000000', '9', '2017-06-22 15:39:48', '2017-06-22 15:39:51', '3', '100000');
INSERT INTO `sanpham` VALUES ('18', '1', '1', 'Sony Xperia X', 'Màn hình : 5.0 inch (1080 x 1920 pixels)\r\nCamera : Chính: 23.0 MP, Phụ: 13.0 MP\r\nRAM : 3 GB\r\nBộ nhớ trong : 64 GB\r\nHệ điều hành : Android 6.0 (Marshmallow)\r\nChipset : Qualcomm MSM8956 Snapdragon 650\r\nCPU : Dual-core 1.8 GHz & Quad-core 1.4 GHz\r\nKích thước : 142.7 x 69.4 x 7.9 mm\r\nGPU : Adreno 510', 'Màn hình : 5.0 inch (1080 x 1920 pixels)\r\nCamera : Chính: 23.0 MP, Phụ: 13.0 MP\r\nRAM : 3 GB\r\nBộ nhớ trong : 64 GB\r\nHệ điều hành : Android 6.0 (Marshmallow)\r\nChipset : Qualcomm MSM8956 Snapdragon 650\r\nCPU : Dual-core 1.8 GHz & Quad-core 1.4 GHz\r\nKích thước : 142.7 x 69.4 x 7.9 mm\r\nGPU : Adreno 510', '7900000', null, '8500000', '10', '2017-06-22 15:41:04', '2017-06-23 15:41:07', '9', '100000');
INSERT INTO `sanpham` VALUES ('19', '1', '1', 'Sony Xperia XA 16GB', 'Màn hình IPS LCD 5\" HD\r\nHệ điều hành Android 6.0 (Marshmallow)\r\nCamera sau 13 MP\r\nCamera trước 8 MP\r\nCPU Helio P10 8 nhân 64-bit, 2.0 GHz\r\nRAM 2GB\r\nBộ nhớ trong 16GB\r\nHỗ trợ thẻ nhớ MicroSD, 200GB\r\n2 SIM 2 sóng, Nano SIM\r\nKết nối WiFi, 3G, 4G LTE Cat 4\r\nDung lượng pin 2300 mAh\r\nThiết kế:Nguyên khối\r\nChức năng đặc biệt Sạc pin nhanh', 'Điện thoại Sony Xperia XA thuộc series Xperia X được giới thiệu lần đầu tại MWC 2016. Máy được xem là bước đi mới của thương hiệu điện thoại đến từ “xứ sở hoa anh đào” nhằm định hình lại dòng sản phẩm trong phân khúc tầm trung của hãng. Qua đó, tạo sức cạnh tranh mới trên thị trường smartphone đang ngày càng khốc liệt. Sony Xperia XA được đổi mới với một thiết kế đẹp mắt. Cấu hình mạnh mẽ với vi xử lý 64-bit 8nhân và camera được đầu tư kỹ lưỡng. Sản phẩm hứa hẹn sẽ thu hút được nhiều sự quan tâm của giới công nghệ cũng như người dùng yêu thích thương hiệu Sony.\r\n\r\nThiết kế mới mẻ, không viền cạnh\r\nXperia XA mang nhiều cải tiến trong thiết kế nhằm mang lại sự tiện dụng tối đa cho người dùng đồng thời làm tăng nét cao cấp của dòng sản phẩm. Máy có thiết kế tinh tế, gọn gàng trên từng góc cạnh, vừa vặn trong lòng bàn tay nhưng vẫn toát lên vẻ bền bỉ và cứng cáp, nổi bật khi cầm trên tay. Thêm nữa, màn hình kích thước 5.0 inch với mặt kính cong được nối liền mạch với khung được bo tròn giúp tối đa hóa không gian hiển thị mà không khiến điện thoại to hơn.\r\n\r\nVi xử lý mạnh mẽ\r\nSở hữu vi xử lý 8 nhân 64-bit MediaTek Helio P10 mạnh mẽ, Xperia XA luôn sẵn sàng để thực thi hiệu quả mọi yêu cầu tác vụ từ phía người dùng. Thêm vào đó, dung lượng RAM 2GB mang đến một không gian khá thoải mái cho việc thực thi đa nhiệm. Chưa hết, hệ điều hành Android 6.0 Marshmallow mới nhất được cài sẵn trong máy sẽ giúp người dùng được trải nghiệm những tính năng và nâng cấp mới nhất từ Google, đảm bảo cho máy luôn hoạt động ổn định và mượt mà trong suốt quá trình sử dụng.\r\n\r\nSony Xperia XA\r\n\r\n\r\nBộ đôi camera được đầu tư kỹ lưỡng\r\nCamera chính của Sony Xperia XA có độ phân giải 13MP, sử dụng cảm biến ảnh Exmor RS, được tích hợp tính năng tự động lấy nét kép giúp bạn chụp được những bức ảnh sáng đẹp và và rõ nét. Và nhờ phạm vi tiêu cự rộng, người dùng có thể chạm vào mọi điểm trên màn hình, thậm chí là các góc và lấy nét vào đối tượng một cách nhanh chóng và dễ dàng. Trong khi đó, Xperia XA có camera trước 8MP cho phép chụp ảnh selfie theo nhóm dễ dàng nhờ ống kính góc rộng 88 độ, cộng thêm công nghệ thu nhận ánh sáng yếu sẽ cho ra những bức hình “tự sướng” đẹp ấn tượng ngay cả trong điều kiện thiếu sáng.\r\n\r\nSony Xperia XA\r\n\r\n\r\nThời lượng sử dụng pin lâu\r\nTheo công bố của nhà sản xuất, smartphone Xperia XA có khả năng cung cấp cho người dùng thời lượng pin đột phá lên tới 2 ngày chỉ với một lần sạc. Nhờ đó bạn có thể thỏa sức nghe nhạc, trò chuyện lâu hơn và tha hồ vi vu lướt web mà không cần phải lo lắng máy cạn pin bất ngờ.', '3790000', null, '5000000', '9', '2017-06-14 15:43:57', '2017-06-17 15:44:01', '10', '100000');
INSERT INTO `sanpham` VALUES ('20', '1', '1', 'Sony Xperia Xzs', '3G:HSPA 42.2/5.76 Mbps\r\n4G:LTEA Cat9 450/50 Mbps\r\nSIM:2 SIM (NanoSIM)\r\nKích thước:146 x 72 x 8.1 mm (5.75 x 2.83 x 0.32 in)\r\nTrọng lượng:161 g (5.68 oz)\r\nMàn hình:Cảm ứng điện dung IPS LCD, 16 triệu màu\r\nKích thước màn hình:1080 x 1920 pixels, 5.2 inches (~424 ppi mật độ điểm ảnh)\r\nBộ nhớ trong:64 GB, 4 GB RAM\r\nKhe cắm thẻ nhớ:microSD, lên đến 256 GB\r\nWLAN:WiFi 802.11 a/b/g/n/ac, dualband, WiFi Direct, DLNA, hotspot', 'Thiết kế Sony Xperia XZs toát lên vẻ sang trọng\r\nXperia XZs thừa hưởng thiết kế của Xperia XZ với bộ khung kim loại nguyên khối, tuy nhiên điểm khác biệt là mặt lưng của máy được làm mờ hơn, giúp máy ít bám mồ hôi và dấu vân tay.\r\nMàn hình Sony Xperia XZs hiển thị sắc nét\r\n\r\nSony Xperia XZs sở hữu tính năng chống nước\r\nHiệu năng Sony Xperia XZs rất mạnh mẽ\r\nKhông được trang bị con chip Snapdragon 835 như người anh em Xperia XZ Premium nhưng với chip Snapdragon 820, hiệu năng của Xperia XZs vẫn là rất tốt.\r\n\r\n \r\nXperia XZs tích hợp cảm biến vân tay và công nghệ sạc nhanh\r\nVới cảm biến vân tay tích hợp vào nút nguồn nằm ở cạnh phải, Xperia XZs giúp người dùng mở khóa máy nhanh chóng. Đồng thời, đây cũng là một biện pháp nâng cao khả năng bảo mật của thiết bị.\r\nCamera Sony Xperia XZs thừa hưởng công nghệ hiện đại của XZ Premium\r\nSony Xperia XZs chính hãng được giữ lại nguyên vẹn những điểm nổi trội về camera từ Xperia XZ Premium. Cụ thể, camera chính của máy có độ phân giải 19MP, khẩu độ lớn (f/2.0), tích hợp công nghệ Motion Eye cho phép tiên đoán chuyển động để chụp 4 bức ảnh trước thời điểm bấm máy 2 giây.', '12843000', null, '14000000', '3', '2017-06-13 15:44:59', '2017-06-15 15:45:03', '8', '100000');
INSERT INTO `sanpham` VALUES ('21', '1', '1', 'Sony Xperia Z3 16GB', 'Màn hình:IPS LCD, 5.2\", Full HD\r\nHệ điều hành:Android 4.4 (KitKat)\r\nCamera sau:20.7 MP\r\nCamera trước:2.2 MP\r\nCPU:Qualcomm Snapdragon 801 4 nhân 32-bit, 2.5 GHz\r\nBộ nhớ trong:16 GB\r\nHỗ trợ thẻ nhớ:MicroSD, 128 GB\r\nThẻ SIM:1 Sim, Nano SIM\r\nDung lượng pin:3100 mAh\r\nThiết kế:Nguyên khối', 'Thiết kế khung kim loại chắc chắn, siêu mỏng\r\n\r\n \r\n\r\nSony Xperia Z3 sẽ khiến cho bạn bất ngờ vì độ mỏng của nó. Máy chỉ có độ dày 7,35 mm và khiến cho một chiếc máy màn hình lớn 5,2 inch hoàn toàn nằm gọn trong bàn tay bạn. Tuy mỏng manh như vậy nhưng Sony Xperia Z3 lại tạo nên một vẻ vững chắc và cao cấp hiếm có nhờ bộ khung kim loại chắc chắn. So với Xperia Z2, Sony Xperia Z3 có sự bo tròn và liền lạc hơn ở phần hai mặt kính và khung nhôm, đồng thời các chi tiết cũng được làm đơn giản để máy mỏng nhẹ, tinh tế hơn. Ngôn ngữ máy thiết kế theo phong cách đơn giản nhưng chất lượng gia công lại sắc sảo đến từng chi tiết, cho bạn một chiếc máy hoàn hảo về thiết kế.\r\n\r\nCamera 20,7 MP công nghệ xử lý BIONZ thông minh, chụp hình như máy ảnh\r\n\r\n \r\n\r\nSony đã tích lũy tất cả những gì tinh túy nhất cho camera trên Sony Xperia Z3. Camera chính của máy sử dụng cảm biến hình ảnh 1/2,3” độ phân giải 20,7 MP cho độ nhạy sáng cao, giảm nhiễu cho phép tái tạo hình ảnh mượt mà, rõ ràng, từng chi tiết trong bức ảnh đều tuyệt đẹp với độ chính xác gần như tuyệt đối.\r\n\r\nỐng kính sử dụng trên Z3 là ống kính G với nhiều cải tiến về dải ISO rộng cho khả năng lấy nét vượt trội và chụp được nhiều ánh sáng trong các điều kiện ánh sáng khắc nghiệt. Ngoài phần cứng cao cấp, Điện thoại Sony Xperia Z3 còn được Sony trang bị công nghệ xử lý hình ảnh BIONZ thông minh cho di động để máy có khả năng cân bằng sáng cũng như cân bằng màu sắc chính xác hơn. Quay video siêu nét độ phân giải 4K\r\n\r\n \r\n\r\nNếu bạn đã hài lòng với độ nét của những đoạn phim Full HD 1920x1080 pixel thì hãy thử cảm giác quay phim với Sony Xperia Z3. Chiếc máy này có thể quay được những video có độ chi tiết và sắc nét gấp 4 lần Full HD khi mà Z3 có khả năng quay video 4K (3840x2160 pixel). Bạn có thể thưởng thức video này ngay trên điện thoại hoặc xem trên TV hay máy chiếu qua cổng kết nối MHL 3.0 mới nhất.\r\n\r\n \r\n\r\nMàn hình 5,2 inch Full HD sống động, sắc nét, chân thực\r\n\r\n \r\n\r\nSony có đầy đủ kinh nghiệm để sản xuất cho chiếc điện thoại cao cấp Sony Xperia Z3 một màn hình hiển thị rực rỡ nhất. Những công nghệ như IPS, TRILUMINOS Display, X-Reality hay Live Colour LED kết hợp cùng độ phân giải Full HD 1920x1080 pixel cho bạn một màn hình 5,2 inch tuyệt mĩ, sắc nét đến từng chi tiết, màu sắc chân thực, tự nhiên và sống động.\r\n\r\nCamera 20,7 MP công nghệ xử lý BIONZ thông minh, chụp hình như máy ảnh\r\n\r\n \r\n\r\nSony đã tích lũy tất cả những gì tinh túy nhất cho camera trên Sony Xperia Z3. Camera chính của máy sử dụng cảm biến hình ảnh 1/2,3” độ phân giải 20,7 MP cho độ nhạy sáng cao, giảm nhiễu cho phép tái tạo hình ảnh mượt mà, rõ ràng, từng chi tiết trong bức ảnh đều tuyệt đẹp với độ chính xác gần như tuyệt đối.\r\n\r\nỐng kính sử dụng trên Z3 là ống kính G với nhiều cải tiến về dải ISO rộng cho khả năng lấy nét vượt trội và chụp được nhiều ánh sáng trong các điều kiện ánh sáng khắc nghiệt. Ngoài phần cứng cao cấp, Điện thoại Sony Xperia Z3 còn được Sony trang bị công nghệ xử lý hình ảnh BIONZ thông minh cho di động để máy', '5590000', null, '7000000', '4', '2017-05-09 15:46:19', '2017-05-12 15:46:23', '5', '100000');
INSERT INTO `sanpham` VALUES ('22', '1', '1', 'Xiaomi Mi5 64GB', 'Cảm biến vân tay\r\nDung lượng pin: 3000mAh\r\nHệ điều hành: Android 6.0 (Marshmallow)\r\nRAM: 3Gb\r\nBộ nhớ trong: 64GB\r\nMàn hình: 5.15 inches IPS LCD 1920 x 1080 Full HD\r\nCảm ứng điện dung đa điểm/ Kính cường lực Gorilla Glass 4\r\nCamera: 13MP/ 4MP\r\nCPU: Qualcomm Snapdragon 820 Quad-core (2x2.15 GHz Kryo & 2x1.6 GHz Kryo) - Prime edition\r\nKết nối mạng: 2G/ 3G/ 4G/ Wifi/ Bluetooth/ GPS\r\n', '1. THÔNG TIN SẢN PHẨM\r\n\r\nXiaomi Mi5 điện thoại thông minh 2 SIM sở hữu phần cứng cao cấp\r\n\r\nXiaomi Mi5 chiếc điện thoại thông minh cao cấp tích hợp 2 SIM, trang bị đầy đủ các tính năng hàng đầu hiện nay như công nghệ nhận diện vân tay, kết nối mới USB Type-C. Bên cạnh đó, Mi5 cũng mang tới cấu hình cao, chip xử lý mới nhất, Ram 3GB.\r\nThiết kế kim loại nguyên khối\r\n\r\nSản phẩm đã thay đổi hoàn toàn so với chiếc Mi4 trước đó. Toàn bộ vỏ máy cũng như khung viền máy được làm bằng kim loại nguyên khối nên Mi5 bền hơn, tính tế hơn so với phiên bản hồi năm ngoái.\r\nCamera chính 16MP sử dụng công nghệ ổn định hình quang học OIS\r\n\r\nMi5 được trang bị camera chính 16 MP IMX298 của Sony kết hợp với công nghệ ổn định hình ảnh quang học OIS, cho hình ảnh chụp đẹp, sắc nét, hỗ trợ chụp ảnh động vô cùng tuyệt vời.\r\n\r\nCamera selfies 4MP phía trước\r\n\r\nChiếc camera selfies phía trước có độ phân giải 4MP với khẩu độ ống kính F/2.0, hỗ trợ chụp với góc rộng 80 độ. Camera hỗ trợ chụp ảnh đẹp, màu sắc trung thực, độ chi tiết cao, hỗ trợ đầy đủ các tính năng chụp ảnh hiện nay như chụp toàn cảnh Panorama...\r\n\r\n \r\n\r\nMàn hình 5.15 inch Full HD\r\n\r\nXiaomi mi5 sở hữu màn hình hiển thị 5.15 inch với độ phân giải Full HD mà không phải QHD như một số thông tin rò rỉ trước đó. Tuy độ phân giải màn hình không cao nhưng nó lại cũng cấp điểm ảnh nhiều hơn đem lại trải nghiệm sắc nét, độ chi tiết cao.\r\n\r\nPin 3000 mAh, công nghệ sạc nhanh Quick Charge 3.0\r\n\r\nPin trên máy có dung lượng 3000 mAh cho thời gian sử dụng cao. Máy còn được trang bị công nghệ sạc nhanh Quick Charge 3.0, giúp sạc nhanh hơn 20% so với chuẩn sạc Quick Charge 2.0. Được biết, Mi5 có thể sạc 80 tới 90% pin chỉ mất 1 giờ.', '5280000', null, '6000000', '6', '2017-06-22 15:47:28', '2017-06-23 15:47:31', '7', '100000');
INSERT INTO `sanpham` VALUES ('23', '1', '1', 'Xiaomi Mi6 64GB 6GB Ram', 'HĐH: Android v7.1.1 (Nougat); MIUI 8.0\r\nMàn hình: IPS LCD 5.15 inch độ phân giải Full HD\r\nCPU: Snapdragon 835 8 nhân (4x2.45 GHz Kryo & 4x1.9 GHz Kryo); GPU: Adreno 540\r\nRAM: 6GB; Bộ nhớ trong: 64GB\r\nCamera sau: Dual 12 MP, OIS (4axis), quay phim 4K\r\nCamera trước: 8 MP\r\nPin: 3350 mAh (Sạc nhanh)\r\nSIM: 2; USB TypeC\r\nNgôn ngữ : Tiếng anh , tiếng trung ( Để yêu cầu để nguyên Seal hoặc cài Tiếng Việt Vui lòng nhắn tin theo cú pháp: Số đơn hàng \" seal\" hoặc \"TV\" gửi đến số: 012340.33333', 'Xiaomi Mi6 vừa mới cập bến thị trường Việt nam với mức giá 11,5 triệu đồng và ngay lập tức nhận được sự chú ý nhờ những thay đổi ấn tượng, đặc biệt là cụm camera kép độc đáo.\r\n\r\nXiaomi Mi6 chính thức được bán ra tại thị trường Trung Quốc vào ngày 28/4 và chỉ một ngày sau, siêu phẩm này đã có mặt tại Việt Nam. Sức hút của Mi6 thực sự rất lớn bởi đây là mẫu smartphone mà nhiều người dùng đã chờ đợi từ rất lâu, với những cải tiến vượt trội hơn so với thế hệ cũ. Có rất nhiều mỹ từ để miêu tả về Mi6, đặc biệt là cấu hình có thể nói là mạnh nhất thế giới hiện nay với con chip Snapdragon 835, RAM mặc định 6GB và bộ nhớ trong đạt 64GB. Hiện tại, giá bán tham khảo cho Xiaomi Mi6 bản thấp nhất tại Việt Nam là 11,5 triệu đồng, cao hơn mức giá niêm yết tại Trung Quốc là 3 triệu đồng. Các phiên bản đặc biệt như màu bạc hay vỏ gốm sẽ về muộn hơn do số lượng hàng hạn chế.\r\n\r\nXiaomi Mi6 có những thay đổi về thiết kế so với Mi5 khi cầm vừa tay, mặt lưng được tối ưu tốt hơn, dễ cầm nắm hơn rất nhiều. Nếu chỉ nhìn qua mặt lưng với các cạnh cong tràn, nhiều người đã nghĩ đến đây là một phiên bản khác của Note 4. Việc sử dụng chất liệu là kính kết hợp cùng khung kim loại chắc chắn giúp Mi6 có được khả năng kháng nước và kháng bụi. Nên nhớ, Xiaomi cũng không khuyến cáo người dùng sử dụng sản phẩm này trong môi trường nước vì đây chỉ là khả năng kháng mà thôi, không phải tiêu chuẩn cao như IP67 trên iPhone 7 và IP68 trên các dòng sản phẩm của Samsung.', '9462000', null, '11000000', '7', '2017-06-15 15:48:16', '2017-06-22 15:48:18', '5', '100000');
INSERT INTO `sanpham` VALUES ('24', '1', '1', 'Xiaomi Redmi Note 4X 32GB', 'Màn hình: Full HD, 5.5\", 1080 x 1920 pixels,Mật độ điểm ảnh ~441 ppiHệ điều hành: Android v6.0 (Marshmallow)Camera sau: 13 MPCamera trước: 5 MPCPU: Snapdragon 625, 8 nhân, Octacore 2.0 GHz CortexA53RAM: 3 GBBộ nhớ trong: 32 GBThẻ SIM: 2 sim 2 sóng, Nano SIM, Micro SIMDung lượng pin: 4100 mAhCảm biến vân tay mặt lưng siêu nhạyNgôn ngữ : Đa ngôn ngữ Tiếng anh , tiếng Việt ....', '1. Thiết kế Xiaomi Redmi Note 4X Miku Edition: màu xanh ngọc đặc biệt cực đẹp\r\n2. Màn hình Xiaomi Redmi Note 4X Miku Edition: màn hình Full HD hiển thị sắc nét\r\n3. Cấu hình Xiaomi Redmi Note 4X Miku: Mạnh mẽ\r\n4. Camera Xiaomi Redmi Note 4X Miku Editon: Hình ảnh sắc nét\r\nĐược trang bị cấu hình mạnh mẽ, Xiaomi Redmi Note 4X Miku không chỉ giúp người dùng có được sự mượt mà khi chạy đa nhiệm mọi tác vụ thậm chí các game thủ yêu thích game online trên thiết bị điện thoại di động vô cùng thích thú khi trải nghiệm game trên máy. Bởi nó mang đến sự mượt mà, không giật lag...ngay cả khi chơi game nặng, game online...\r\n1. Thiết kế Xiaomi Redmi Note 4X Miku Edition: màu xanh ngọc đặc biệt cực đẹp\r\n2. Màn hình Xiaomi Redmi Note 4X Miku Edition: màn hình Full HD hiển thị sắc nét\r\n3. Cấu hình Xiaomi Redmi Note 4X Miku: Mạnh mẽ\r\n4. Camera Xiaomi Redmi Note 4X Miku Editon: Hình ảnh sắc nét\r\nĐược trang bị cấu hình mạnh mẽ, Xiaomi Redmi Note 4X Miku không chỉ giúp người dùng có được sự mượt mà khi chạy đa nhiệm mọi tác vụ thậm chí các game thủ yêu thích game online trên thiết bị điện thoại di động vô cùng thích thú khi trải nghiệm game trên máy. Bởi nó mang đến sự mượt mà, không giật lag...ngay cả khi chơi game nặng, game online...\r\n', '3395000', null, '5200000', '8', '2017-06-22 15:49:11', '2017-06-22 15:49:13', '9', '100000');
INSERT INTO `sanpham` VALUES ('25', '1', '2', 'Bộ 5 cốc sạc Samsung Galaxy Note 4', 'Sản xuất tại Việt Nam- Với công nghệ sạc nhanh được Samsung giới thiệu cho Galaxy Note 4, củ sạc Galaxy Note 4 cũng được thiết kế hoàn toàn khác khi điện áp và dòng đầu ra cũng được chia thành 2 phần: 9.0V - 1.67A ( hỗ trợ sạc nhanh ) và 5.0V - 2.0A\r\n- Sản phẩm hỗ trợ công nghệ Fast Charging của Samsung\r\n- Củ sạc bán ra tại shop chúng tôi là hàng chính hãng 100% các bạn có thể tham khảo cách phân biệt dưới đây:\r\n* Củ sạc chính hãng có logo: Adaptive Fast Charging ở mặt sau của sạc\r\n* Củ sạc cho Note 4 có 2 dòng out put như thông số ở treen\r\n* Củ sạc Note 4 được sản xuất tại Việt Nam ( Made in Việt Nam )\r\n* Mạch của củ sạc được làm chi tiết, không như sản phẩm nhái, phải có Silicon gắn trên mạch tránh chập cháy.\r\n* Chân cắm USB bên trong được làm bằng đồng sáng bóng.pin và bộ sạc , pin và bộ sạc Samsung, Samsung', 'Sản xuất tại Việt Nam- Với công nghệ sạc nhanh được Samsung giới thiệu cho Galaxy Note 4, củ sạc Galaxy Note 4 cũng được thiết kế hoàn toàn khác khi điện áp và dòng đầu ra cũng được chia thành 2 phần: 9.0V - 1.67A ( hỗ trợ sạc nhanh ) và 5.0V - 2.0A\r\n- Sản phẩm hỗ trợ công nghệ Fast Charging của Samsung\r\n- Củ sạc bán ra tại shop chúng tôi là hàng chính hãng 100% các bạn có thể tham khảo cách phân biệt dưới đây:\r\n* Củ sạc chính hãng có logo: Adaptive Fast Charging ở mặt sau của sạc\r\n* Củ sạc cho Note 4 có 2 dòng out put như thông số ở treen\r\n* Củ sạc Note 4 được sản xuất tại Việt Nam ( Made in Việt Nam )\r\n* Mạch của củ sạc được làm chi tiết, không như sản phẩm nhái, phải có Silicon gắn trên mạch tránh chập cháy.\r\n* Chân cắm USB bên trong được làm bằng đồng sáng bóng.pin và bộ sạc , pin và bộ sạc Samsung, Samsung', '1520000', null, '1600000', '4', '2017-06-15 15:50:43', '2017-06-17 15:50:45', '10', '100000');
INSERT INTO `sanpham` VALUES ('26', '1', '2', 'Bộ sạc 10 cổng USB 96W max - UGREEN CD108', 'Bộ sạc điên USB này là một giải pháp hoàn hảo cho bạn để sạc nhiều sản phẩm điện tử của bạn chẳng hạn như điện thoại di động, Ipad, máy ảnh vv trong cùng một thời điểm\r\nCông suất 96W đủ đáp ứng nguồn cho tất cả thiết bị của bạn\r\nTiện dụng\r\n', null, '2462000', null, '2500000', '5', '2017-06-07 15:52:11', '2017-06-16 15:52:13', '10', '100000');
INSERT INTO `sanpham` VALUES ('27', '1', '2', 'Pin dự phòng Sony S20 - 20.000 mAh', 'Pin lithium ion 20.000 mAh 2 tích hợp Cho phép sạc điện thoại lên đến 8 lần Sạc đến bốn thiết bị cùng lúc với tổng đầu ra tối đa là 6,9A Tính năng sạc bắc cầu để sạc CP-S20 trong khi sạc các thiết bị của bạn Duy trì được hơn 90% dung lượng sau khoảng 1.000 lần sạc', null, '2000000', null, '2500000', '4', '2017-06-28 15:54:43', '2017-06-30 15:54:49', '9', '100000');
INSERT INTO `sanpham` VALUES ('28', '1', '2', 'Pin sạc dự phòng Mili Power King 18000 mAh', 'Dung lượng siêu khủng 18000 mAh\r\nSạc dự phòng được cho tất cả các thiết bị di động như: Máy tính xách tay (Laptop)Smartphones (Android, iOS, Window Phone,..), Máy tính bảng (Tablets), Tai nghe Bluetooth, Máy nghe nhạc MP3, Thiết bị game cầm tay\r\nTiện dụng\r\n', '1. Sạc Power King:\r\n\r\n- Luôn luôn sạc đủ 8 giờ cho lần sạc đầu tiên trước khi sử dụng sản phẩm.\r\n\r\n- Khi bảng điều khiển LCD hiện \"100%\" thì Mili Power King đã đầy sạc\r\n\r\n2. Sạc các thiết bị khác\r\n\r\n- Lưu ý: Kiểm tra khả năng tương thích điện áp với thiết bị của bạn đầu tiên\r\n\r\n- Lựa chọn phù hợp và đúng dây cáp cho việc sạc thiết bị điện tử khác nhau (5V USB Charging cable - Cáp sạc USB 5V; 9V - 12V cable - Cáp sạc 9V - 12V; 12V - 20V cable - Cáp sạc 12 - 20V)\r\n\r\n- Đưa cáp sạc đúng vào đúng cổng của Power King\r\n\r\n- Chọn đầu phù hợp cho thiết bị kỹ thuật số của bạn hoặc cắm cáp trực tiếp vào trong thiết bị nếu nó vừa\r\n\r\n- Đưa phần cuối cùng của cáp sạc với đầu đúng vào trong cổng sạc của thiết bị bạn sử dụng\r\n\r\n3. Sạc iPad - QUAN TRỌNG\r\n\r\n- Đầu USB ra: 5V/1A. Khi bạn muốn sạc iPad, hãy ấn và giữ nút nguồn liên tục trong 5 giây => Đầu ra sẽ tăng lên 5V/2.1A\r\n\r\n- Đầu ra USB: sẽ trở lại 5V/1A trong vòng 10 giây sau khi ngắt kết nối với iPad\r\n\r\n4. DELL Laptop User (Dành cho người sử dụng máy tính xách tay DELL) - QUAN TRỌNG\r\n\r\nDung lượng cực lớn\r\n\r\nVới dung lượng 18000mAh, pin sạc chắc chắn sẽ là nguồn lưu trữ nguồn điện lý tưởng cho các thiết bị của bạn. Với siêu công suất này bạn có thể hoàn toàn an tâm khi đi chơi, đi công tác xa, hay đi du lịch mà không tìm ra nguồn sạc.\r\n', '3418000', null, '4000000', '5', '2017-06-20 15:56:37', '2017-06-22 15:56:40', '10', '100000');
INSERT INTO `sanpham` VALUES ('29', '1', '2', 'Pin sạc dự phòng Romoss Sense mini 5000 mAh', '\r\nROMOSS SENSE MINI\r\n\r\nPin sạc dự phòng Romoss Sense mini 5000mAh là nguồn cung cấp năng lượng hữu dụng cho điện thoại của bạn trong những trường hợp khẩn cấp.\r\nRomoss Sense mini có dung lượng pin lớn đến 5000mAh, có thể sạc nhiều lần các dòng điện thoại, máy tính bảng hiện nay.', 'ROMOSS là một nhà cung cấp công nghệ theo định hướng và đáng tin cậy về giải pháp pin, Sạc trên toàn cầu, chuyên về Pin, bộ sạc di động, bộ sạc xe hơi và Adapter sạc cho tất cả các thiết bị di động. Với sự đổi mới liên tục và ứng dụng các công nghệ mới nhất, sản phẩm chất lượng cao và dịch vụ tuyệt vời, ROMOSS đã đạt được rất nhiều người tiêu dùng biết đến và có các nhà phân phối tại hơn 40 quốc gia trên toàn thế giới. Tại Việt Nam Phúc Thịnh JSC cũng đã được bổ nhiệm là nhà phân phối uỷ quyền chính thức các sản phẩm  Romoss.', '1850000', null, '2000000', '10', '2017-06-20 15:57:22', '2017-06-23 15:57:24', '1', '100000');
INSERT INTO `sanpham` VALUES ('30', '1', '3', 'Gimbal Wenpod SP1 thiết bị cân bằng cho Smartphone', 'Cân bằng khung hình cho smartphone khi quay phim \r\nHỗ trợ chụp ảnh xoay 360 độ, panorama \r\nBrushless motor giúp chuyển động mượt mà \r\nKích thước: 13.5 x 14.5 x 7.4cm ', 'BIẾN SMARTPHONE THÀNH MÁY QUAY PHIM CHUYÊN NGHIỆP WenPod SP1+ được sản xuất dành riêng cho smartphones. Tích hợp công nghệ độc quyền của A.I và động cơ không chổi than giúp cải thiện \r\n \r\nỔN ĐỊNH VỚI GÓC QUAY 360° Thiết kế chuyển động quay tự do giúp ổn định vị trí và chống rung khi điện thoại của bạn thực hiện việc quay phim hay chụp hình trong mọi vị trí và hướng (góc) quay. Hai động cơ trượt kết hợp nhau lăn và cảm biến tương tác liền mạch giúp ổn định máy quay.\r\n \r\nCẦN CHUYỂN HƯỚNG ỔN ĐỊNH GÓC NGHIÊNG Nút điều chỉnh và ổn định thiết bị ở góc máy nghiêng được tích hợp ngay trên thân máy, thông qua 1 nút điều khiển bằng ngón tay. \r\n ​\r\nTHIẾT KẾ TỐI ƯU VÀ TIỆN DỤNG  \r\nVỪA VỚI HẦU HẾT SMARTPHONE SP1+ gắn vừa với hầu hết các loại smartphone hiện có trên thị trường. Thiết kế khóa cài tiện lợi, việc lắp đặt smartphone vào chỉ mất vài giây.\r\n \r\nPIN RỜI CÓ THỂ THAY THẾ ĐƯỢC Lõi pin lithium polymer với mạch bảo vệ tích hợp và ngõ sạc nhanh. Có thể sạc riêng lõi pin bằng dock sạc rời (chưa có sẵn trong bộ sản phẩm).', '5715000', null, '6000000', '9', '2017-06-20 15:58:09', '2017-06-22 15:58:12', '6', '100000');
INSERT INTO `sanpham` VALUES ('31', '1', '3', 'Ổ cứng di động  Apple Android Mili iData 256GB', null, 'Mở rộng bộ nhớ của iPhone*; iPad * ( 16/32/64/128/256 GB) và các thiết bị android khác.\r\nLưu trữ tất cả file xử lý trên thiết bị: .doc; .xls; mp4; jpg…\r\nSao lưu và chuyển đổi tất cả các file từ thiết bị này sang thiết bị khác 1 cách đơn giản\r\nBackup và Restore danh bạ\r\nThiết bị duy nhất được Apple chứng nhận sản phẩm ổ cứng di động dùng cho các sản phẩm của Apple.\r\nMili iData là một trong những thiết bị hiếm hoi được Apple chứng nhận là sản phẩm ổ cứng di động dùng cho các sản phẩm của hãng. \r\nMili iData có thiết kế khá nhỏ gọn, vỏ bằng nhôm khối với chất lượng hoàn thiện tốt. Sản phẩm có dung lượng bộ nhớ 16 GB giúp mở rộng bộ nhớ cho các máy iPhone và Android. Ở đầu phía trước là một cổng Lightning để cắm vào các máy chạy iOS. Phía sau là một cổng microUSB để kết nối cáp với máy tính hoặc điện thoại Android. \r\nPhụ kiện đi kèm có một cáp hai đầu đều là microUSB, cáp còn lại có một đầu USB và một đầu microUSB. \r\nCắm trực tiếp Mili iData đọc dữ liệu với iPhone 6. Người dùng cần cài thêm phần mềm riêng do Mili cung cấp để thực việc việc chuyển đổi dữ liệu. \r\nVới các máy Android, người dùng cần sử dụng thêm dây cáp hai đầu microUSB để kết nối. Tuy nhiên, hệ điều hành của Google không đòi hỏi phải cài thêm phần mềm mà chỉ cần dùng sẵn ứng dụng đọc tập tin trong máy. \r\nViệc sao lưu ảnh ra Mili iData và ngược lại không cần qua máy tính, có thể sao lưu nội dung ở mọi nơi. Các máy cũng có thể chơi file nhạc hoặc xem ảnh, văn bản dù vẫn đang lưu ở bộ nhớ ngoài. ', '4190000', null, '6000000', '10', '2017-06-22 15:59:26', '2017-06-23 15:59:31', '4', '100000');
INSERT INTO `sanpham` VALUES ('32', '1', '3', 'Sạc năng lượng mặt trời Anker PowerPort Solar IQ', 'Thương hiệu số 1 tại Mỹ\r\nNguồn sạc sạch \"miễn phí\" vô tận\r\nCông nghệ sạc nhanh và tối ưu từ Anker\r\nTính \"di động\" tuyệt đối\r\nThiết kế an toàn', 'Anker PowerPort Solar Charger\r\nSạc thiết bị với nguồn năng lượng mặt trời vô hạn, phù hợp với xu hướng sử dụng năng lượng tái tạo đang diễn ra mạnh mẽ.\r\nAnker là thương hiệu số 1 tại Mỹ về các giải pháp sạc và pin dự phòng.\r\n- Sạc nhanh và an toàn với công nghệ mới nhất\r\n- Trên 10 triệu khách hàng đã sử dụng sản phẩm Anker\r\nNguồn sạc \"miễn phí\" vô tận\r\nKhi bạn đang vui chơi bên ngoài, chỉ cần mở bung các tấm pin mặt trời và gắn vào ba-lô của bạn là có thể sạc thiết bị thoải mái với 2 cổng có tổng dòng sạc đến 3A, tương đương với một bộ sạc tường công suất khá.\r\nCông nghệ sạc nhanh và tối ưu từ Anker\r\nCông nghệ độc quyền PowerIQ dễ dàng nhận dạng thiết bị và cấp phát dòng sạc tối ưu (lên đến 2.4A / cổng) cho thiết bị đó, giúp sạc nhanh chóng và an toàn.\r\nTính \"di động\" tuyệt đối\r\nThiết kế nhỏ gọn (gấp lại 28.2 × 16 cm hoặc khi mở ra 67 × 28.2), khoen móc ở mỗi góc cho phép bạn gắn lên ba-lô hoặc các vị trí tối ưu để hứng ánh mặt trời 1 cách dễ dàng. Trọng lượng siêu nhẹ (14.7oz) và mỏng (1.1in folded or 0.2in opened), chiếm rất ít không gian trong ba-lô hay túi xách của bạn.\r\nChất liệu siêu bền\r\nTấm pin mặt trời được hoàn thiện bằng chất liệu PET và khâu vào vải polyester siêu bền, giúp chịu đựng trước tác động từ những cuộc dã ngoại, trekking mạo hiểm,...\r\nThiết kế an toàn\r\nMạch bảo vệ chống ngắt mạch và quá tải giúp thiết bị của bạn an toàn tuyệt đối.', '1999000', null, '2500000', '1', '2017-06-27 16:00:36', '2017-06-30 16:00:39', '5', '100000');
INSERT INTO `sanpham` VALUES ('33', '1', '3', 'Thiết bị chống trộm SAMSUNG cổng 4', ' Loại sản phẩm: Chống trộm trung tâm\r\n- SP bao gồm: 01 cổng chống trộm 4 đầu ra USB, 04 cáp sạc và chống trộm, 03 chân đế điện thoại, 01 chân đế máy tính bảng, 01 remote, 01 Adapter (Dây nguồn), và các phụ kiện kèm theo...\r\n- Xuất sứ: Hàn Quốc\r\n- Bảo hành: 12 tháng ( tem bảo hành dán trên sản phẩm ) * Miễn phí giao hàng trên toàn quốc (COD)', 'Cổng chống trộm trung tâm 04 đầu ra USB bao gồm:\r\n- Công tắc ON/OFF: Bật tắt nguồn điện\r\n- Đèn Led : Thông báo tình trạng hoạt động\r\n- Loa báo động: Phát ra báo động khi có tác động\r\n- Khe tản nhiệt hai bên: Giúp sản phẩm hoạt động liên tục mà không bị nóng\r\n- Bốn cổng ra USB, 01 cổng cắm nguồn điện, 01 cổng cắp cảm biến điều khiển từ xa.\r\nƯu điểm bộ thiết bị chống trộm \r\n- Thiết kế sang trọng phù hợp xu hướng của thị trường\r\n- Hoạt động an toàn và ổn định\r\n- Dễ dàng lắp đặt và di chuyển\r\n- Sử dụng chất liệu có độ bền cao\r\n- Dễ dàng thay thế các linh kiện, phụ kiện\r\n\r\nVới bộ thiết bị chống trộm điện thoại, máy tính bảng cao cấp M-5000R được cung cấp bởi HTD VIỆT NAM, giúp sản phẩm trưng bày của cửa hàng điện thoại điện máy an toàn hơn, khách hàng có thể thoải mái trải nghiệm mà không lo bị mất trộm , mất cắp.', '2800000', null, '4000000', '7', '2017-06-20 16:01:48', '2017-06-22 16:01:50', '1', '100000');

-- ----------------------------
-- Table structure for sanphamconguoimua
-- ----------------------------
DROP TABLE IF EXISTS `sanphamconguoimua`;
CREATE TABLE `sanphamconguoimua` (
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) NOT NULL,
  KEY `fk_SANPHAMCONGUOIMUA_USER1_idx` (`USER_idUSER`),
  KEY `fk_SANPHAMCONGUOIMUA_SANPHAM` (`idsanpham`),
  CONSTRAINT `fk_SANPHAMCONGUOIMUA_SANPHAM` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`idSANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SANPHAMCONGUOIMUA_USER1` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamconguoimua
-- ----------------------------

-- ----------------------------
-- Table structure for sanphamyeuthich
-- ----------------------------
DROP TABLE IF EXISTS `sanphamyeuthich`;
CREATE TABLE `sanphamyeuthich` (
  `USER_idUSER` int(11) NOT NULL,
  `idsanpham` int(11) NOT NULL,
  KEY `fk_SANPHAMYEUTHICH_USER_idx` (`USER_idUSER`),
  KEY `fk_SANPHAMYEUTHICH_SANPHAM` (`idsanpham`),
  CONSTRAINT `fk_SANPHAMYEUTHICH_SANPHAM` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`idSANPHAM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SANPHAMYEUTHICH_USER` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanphamyeuthich
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `idUSER` int(11) NOT NULL AUTO_INCREMENT,
  `tendangnhap` varchar(30) DEFAULT NULL,
  `matkhau` varchar(30) DEFAULT NULL,
  `hoten` varchar(100) DEFAULT NULL,
  `gioitinh` varchar(5) DEFAULT NULL,
  `ngaysinh` datetime DEFAULT NULL,
  `sodienthoai` varchar(20) DEFAULT NULL,
  `diachi` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ngaybatdauban` datetime DEFAULT NULL,
  PRIMARY KEY (`idUSER`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------