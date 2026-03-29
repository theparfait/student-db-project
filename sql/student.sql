-- 1. Tạo bảng Hệ Đào Tạo
USE StudentManagement;
CREATE TABLE HeDaoTao (
    ma_he_dao_tao VARCHAR(20) PRIMARY KEY,
    ten_he_dao_tao NVARCHAR(100)
);

-- 2. Tạo bảng Khoa
CREATE TABLE Khoa (
    ma_khoa VARCHAR(20) PRIMARY KEY,
    ten NVARCHAR(100),
    Dien_thoai VARCHAR(15)
);

-- 3. Tạo bảng Lớp
CREATE TABLE Lop (
    ma_lop VARCHAR(20) PRIMARY KEY,
    ten_lop NVARCHAR(100),
    ma_khoa VARCHAR(20),
    ma_he_dao_tao VARCHAR(20),
    FOREIGN KEY (ma_khoa) REFERENCES Khoa(ma_khoa),
    FOREIGN KEY (ma_he_dao_tao) REFERENCES HeDaoTao(ma_he_dao_tao)
);

-- 4. Tạo bảng Sinh Viên
CREATE TABLE SinhVien (
    ma_sinh_vien VARCHAR(20) PRIMARY KEY,
    ho_ten NVARCHAR(100),
    gioi_tinh NVARCHAR(10),
    ngay_sinh DATE,
    dia_chi NVARCHAR(255),
    so_dien_thoai VARCHAR(15),
    trang_thai NVARCHAR(50),
    ma_lop VARCHAR(20),
    FOREIGN KEY (ma_lop) REFERENCES Lop(ma_lop)
);

-- 5. Tạo bảng Môn Học
CREATE TABLE MonHoc (
    ma_mon_hoc VARCHAR(20) PRIMARY KEY,
    ten_mon_hoc NVARCHAR(100),
    so_tin_chi INT,
    bac_dao_tao NVARCHAR(50)
);

-- 6. Tạo bảng Điểm
CREATE TABLE Diem (
    Hocky INT,
    NamHoc VARCHAR(20),
    ma_sinh_vien VARCHAR(20),
    ma_mon_hoc VARCHAR(20),
    DiemChu VARCHAR(5),
    DiemSO FLOAT,
    PRIMARY KEY (ma_sinh_vien, ma_mon_hoc, Hocky, NamHoc), -- Khóa chính tổng hợp
    FOREIGN KEY (ma_sinh_vien) REFERENCES SinhVien(ma_sinh_vien),
    FOREIGN KEY (ma_mon_hoc) REFERENCES MonHoc(ma_mon_hoc)
);