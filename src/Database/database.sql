/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  anh152003
 * Created: Apr 12, 2024
 */
CREATE DATABASE IF NOT EXISTS RestaurantManagement;

USE RestaurantManagement;

-- Bảng Khách hàng
CREATE TABLE IF NOT EXISTS KhachHang (
    idKH INT AUTO_INCREMENT PRIMARY KEY,
    tenKH VARCHAR(255),
    SDT VARCHAR(20),
    ngayThamGia DATE
);

-- Them Check Constraint
alter table KhachHang
    add constraint KH_TenKH_NNULL check ('tenKH' is not null),
    add constraint KH_Ngaythamgia_NNULL check ('ngayThamGia' is not null);

-- Bảng Hóa đơn
CREATE TABLE IF NOT EXISTS HoaDon (
    idHD INT AUTO_INCREMENT PRIMARY KEY,
    idKH INT,
    idBan INT,
    idNV INT,
    idKM INT,
    ngayHD DATE,
    SoTienTungMon DECIMAL(10,2),
    TienGiamGia DECIMAL(10,2),
    TongTien DECIMAL(10,2),
    FOREIGN KEY (idKH) REFERENCES KhachHang(idKH),
    FOREIGN KEY (idBan) REFERENCES Ban(idBan),
    FOREIGN KEY (idNV) REFERENCES NhanVien(idNV),
    FOREIGN KEY (idKM) REFERENCES KhuyenMai(idKM)
);
ALTER TABLE HoaDon ADD trangThaiHD varchar(50);
-- Thêm check constraint
alter table HoaDon
    add constraint HD_ngayHD_NNULL check ('ngayHD' is not null),
    add constraint HD_trangThaiHD check (trangThaiHD in ('Chua thanh toan','Da thanh toan')),
    add constraint HD_SoTienTungMon_NNULL check ('SoTienTungMon' is not null);




-- Bảng Khuyến mãi
CREATE TABLE IF NOT EXISTS KhuyenMai (
    idKM INT AUTO_INCREMENT PRIMARY KEY,
    moTaKM TEXT,
    phanTramKM DECIMAL(5,2),
    soLuongMaKM INT,
    ngayBatDau DATE,
    ngayKetThuc DATE
);

alter table KhuyenMai
    add constraint KM_idKM_NNULL check ('idKM' is not null),
    add constraint KM_moTaKM_NNULL check ('moTaKM' is not null),
    add constraint KM_ngayBatDau_NNULL check ('ngayBatDau' is not null),
    add constraint KM_ngayKetThuc_NNULL check ('ngayKetThuc' is not null),
    add constraint KM_soLuongMaKM_NNULL check ('soLuongMaKM' is not null and soLuongMaKM >=1),
    add constraint KM_Phantram_NNULL check (phanTramKM > 0 AND phanTramKM <= 100);
   --  add constraint V_LoaiMA_Thuoc check (LoaiMA in ('All','Aries','Taurus','Gemini','Cancer','Leo','Virgo'
--                                                  ,'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces'));

-- Bảng Bàn
CREATE TABLE IF NOT EXISTS Ban (
    idBan INT AUTO_INCREMENT PRIMARY KEY,
    tenBan VARCHAR(255),
    viTri VARCHAR(255),
    trangThai VARCHAR(50),
    SoNguoiTaiBan INT
);

-- Them Check Constraint
alter table Ban
    add constraint Ban_TenBan_NNULL check ('tenBan' is not null),
    add constraint Ban_Vitri_NNULL check ('viTri' is not null),
    add constraint Ban_Trangthai_Ten check (trangThai in ('Con trong','Dang dung bua','Da dat truoc')),
    add constraint Ban_SoNguoiTaiBan_NNULL check ('SoNguoiTaiBan' is not null);

-- Bảng Món Ăn
CREATE TABLE IF NOT EXISTS MonAn (
    idMA INT AUTO_INCREMENT PRIMARY KEY,
    tenMon VARCHAR(255),
    gia DECIMAL(10,2),
    loai VARCHAR(50),
    trangThai VARCHAR(50)
);
-- Thêm check constraint
-- alter table MonAn
--     add constraint MA_TenMon_NNULL check ('tenMon' is not null),
--     add constraint MA_DonGia_NNULL check ('gia' is not null),
--     add constraint MA_Loai_Ten check (Loai in ('Aries','Taurus','Gemini','Cancer','Leo','Virgo'
--                                                  ,'Libra','Scorpio','Sagittarius','Capricorn','Aquarius','Pisces'))
--     add constraint MA_TrangThai_Thuoc check (TrangThai in('Dang kinh doanh','Ngung kinh doanh'));          

-- Bảng Chi tiết hóa đơn
CREATE TABLE IF NOT EXISTS ChiTietHoaDon (
    idMA INT,
    idHD INT,
    slMonAn INT,
    PRIMARY KEY (idMA, idHD),
    FOREIGN KEY (idMA) REFERENCES MonAn(idMA),
    FOREIGN KEY (idHD) REFERENCES HoaDon(idHD)
);

-- Them Check Constraint
alter table ChiTietHoaDon
    add constraint CTHD_slMonAn_NNULL check ('slMonAn' is not null);

-- Bảng Chức vụ
CREATE TABLE IF NOT EXISTS ChucVu (
    idCV INT AUTO_INCREMENT PRIMARY KEY,
    TenChucVu VARCHAR(255)
);

alter table ChucVu
    add constraint NV_Chucvu_Thuoc check (TenChucVu IN ('Phuc vu','Tiep tan','Thu ngan','Bep','Kho','Quan ly'));

-- Bảng Nhân viên
CREATE TABLE IF NOT EXISTS NhanVien (
    idNV INT AUTO_INCREMENT PRIMARY KEY,
    TenNV VARCHAR(255),
    NgayVaoLam DATE,
    SDT VARCHAR(20),
    idCV INT,
    TinhTrang VARCHAR(50),
    FOREIGN KEY (idCV) REFERENCES ChucVu(idCV)
);

-- Them Check Constraint
alter table NhanVien
    add constraint NV_TenNV_NNULL check ('TenNV' is not null),
	add constraint NV_SDT_NNULL check ('SDT' is not null);
alter table NhanVien add constraint NV_NgayVL_NNULL check ('NgayVaoLam' is not null),
    add constraint NV_Tinhtrang_Thuoc check (TinhTrang IN ('Dang lam viec','Da nghi viec'));

-- Bảng Tài sản nhà hàng
CREATE TABLE IF NOT EXISTS TaiSanNhaHang (
    idTS INT AUTO_INCREMENT PRIMARY KEY,
    tenTaiSan VARCHAR(255),
    soLuong INT,
    tinhTrang VARCHAR(50),
    giaTri DECIMAL(10,2),
    ngayMua DATE,
    ghiChu TEXT
);

-- Bảng Kho
CREATE TABLE IF NOT EXISTS Kho (
    idKho INT AUTO_INCREMENT PRIMARY KEY,
    idTS INT,
    idNL INT,
    donViTinh VARCHAR(50),
    soLuongTonKho INT,
    ngayNhapKho DATE,
    ngayHetHan DATE,
    ghiChu TEXT,
    FOREIGN KEY (IdNL) REFERENCES NguyenLieu(IdNL),
    FOREIGN KEY (IdTS) REFERENCES TaiSanNhaHang(idTS)
);

-- Thêm check constraint
alter table Kho
	add constraint K_soLuongTonKho_Null check ('soLuongTonKho' is not null),
    add constraint K_ngayNhapKho_Null check ('ngayNhapKho' is not null),
    add constraint K_ngayHetHan_Null check ('ngayHetHan' is not null),
    add constraint K_donViTinh_Thuoc check (donViTinh in ('g','kg','ml','l'));
    

-- Bảng Nguyên liệu
CREATE TABLE IF NOT EXISTS NguyenLieu (
    idNL INT AUTO_INCREMENT PRIMARY KEY,
    tenNguyenLieu VARCHAR(255),
    donGia DECIMAL(10,2),
    donViTinh VARCHAR(50)
);
-- Them Check Constraint
alter table NguyenLieu
    add constraint NL_tenNguyenLieu_NNULL check ('tenNguyenLieu' is not null),
    add constraint NL_donGia_NNULL check ('donGia' is not null),
    add constraint NL_donViTinh_Thuoc check (donViTinh in ('g','kg','ml','l'));

-- Bảng Phiếu Nhập
CREATE TABLE IF NOT EXISTS PhieuNhap (
    idPN INT AUTO_INCREMENT PRIMARY KEY,
    idNV INT,
    ngayNhap DATE,
    nhaCungCap VARCHAR(255),
    tongTien DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (idNV) REFERENCES NhanVien(idNV)
);
-- Them Check Constraint
alter table PhieuNhap
    add constraint PN_ngayNhap_NNULL check ('ngayNhap' is not null);

-- Bảng Chi tiết phiếu nhập
CREATE TABLE IF NOT EXISTS ChiTietPhieuNhap (
    idNL INT,
    idPN INT,
    soLuong INT,
    thanhTien DECIMAL(10,2),
    PRIMARY KEY (idNL, idPN),
    FOREIGN KEY (idNL) REFERENCES NguyenLieu(idNL),
    FOREIGN KEY (idPN) REFERENCES PhieuNhap(idPN)
);
-- Them Check Constraint
alter table ChiTietPhieuNhap
    add constraint CTPN_soLuong_NNULL check ('soLuong' is not null);

-- Bảng Phiếu Xuất
CREATE TABLE IF NOT EXISTS PhieuXuat (
    idPX INT AUTO_INCREMENT PRIMARY KEY,
    idNV INT,
    ngayXuat DATE,
    FOREIGN KEY (idNV) REFERENCES NhanVien(idNV)
);
-- Them Check Constraint
alter table PhieuXuat
    add constraint PX_ngayXuat_NNULL check ('ngayXuat' is not null);

-- Bảng Chi tiết phiếu xuất
CREATE TABLE IF NOT EXISTS ChiTietPhieuXuat (
    idNL INT,
    idPX INT,
    soLuong INT,
    PRIMARY KEY (idNL, idPX),
    FOREIGN KEY (idNL) REFERENCES NguyenLieu(idNL),
    FOREIGN KEY (idPX) REFERENCES PhieuXuat(idPX)
);
-- Them Check Constraint
alter table ChiTietPhieuXuat
    add constraint CTPX_soLuong_NNULL check ('soLuong' is not null);
    
-- Tạo trigger

-- 1. 

