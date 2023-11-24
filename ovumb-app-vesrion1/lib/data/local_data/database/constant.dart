//tên bảng
const tableNguoiDung = 'NguoiDung';
const tableCauHoi = 'CauHoi';
const tableCauTraLoi = 'CauTraLoi';
const tableNhatKy = 'NhatKy';
const tableLuongKinh = 'LuongKinh';
const tableKinhNguyet = 'KinhNguyet';
const tableThaiKi = 'ThaiKi';
const tableKetQuaTest ='KetQuaTest';
const tableProduct ='Product';

//tạo bảng
const createNguoiDung = '''CREATE TABLE IF NOT EXISTS $tableNguoiDung (
  "maNguoiDung"	TEXT NOT NULL,
  "maTvv"	INTEGER,
  "tenNguoiDung"	TEXT NOT NULL,
  "namSinh"	INTEGER NOT NULL,
  "chieuCao"	INTEGER,
  "canNang"	INTEGER,
  "phase" INTEGER,
  "trangThai" INTEGER,
  PRIMARY KEY("maNguoiDung")
)''';

const createCauHoi = '''CREATE TABLE IF NOT EXISTS $tableCauHoi (
  "maCauHoi"	INTEGER,
  "noiDung"	TEXT NOT NULL,
  PRIMARY KEY("maCauHoi" AUTOINCREMENT)
)''';

const createNhatKy = '''CREATE TABLE IF NOT EXISTS $tableNhatKy (
  "maNhatKy"	INTEGER,
  "maNguoiDung"	TEXT NOT NULL,
  "thoiGian"	INTEGER NOT NULL,
  "trangThai" INTEGER,
  "tonTai" INTEGER DEFAULT 0,
  FOREIGN KEY("maNguoiDung") REFERENCES "NguoiDung"("maNguoiDung"),
  PRIMARY KEY("maNhatKy" AUTOINCREMENT),
  UNIQUE("maNguoiDung","thoiGian")
)''';

const createLuongKinh = '''CREATE TABLE IF NOT EXISTS $tableLuongKinh (
  "maLuongKinh"	INTEGER,
  "maNguoiDung"	TEXT NOT NULL,
  "thoiGian"	INTEGER NOT NULL,
  "luongKinh"	TEXT NOT NULL,
  "trangThai" INTEGER,
  "tonTai" INTEGER DEFAULT 0,
  FOREIGN KEY("maNguoiDung") REFERENCES "NguoiDung"("maNguoiDung"),
  PRIMARY KEY("maLuongKinh" AUTOINCREMENT),
  UNIQUE("maNguoiDung","thoiGian")
)''';

const createCauTraLoi = '''CREATE TABLE IF NOT EXISTS $tableCauTraLoi (
  "maCauTraLoi"	INTEGER,
  "maNhatKy"	INTEGER,
  "maCauHoi"	INTEGER,
  "cauTraLoi"	TEXT,
  UNIQUE("maNhatKy","maCauHoi"),
  PRIMARY KEY("maCauTraLoi" AUTOINCREMENT),
  FOREIGN KEY("maCauHoi") REFERENCES "CauHoi"("maCauHoi"),
  FOREIGN KEY("maNhatKy") REFERENCES "NhatKy"("maNhatKy")
)''';

const createKinhNguyet = '''CREATE TABLE IF NOT EXISTS $tableKinhNguyet (
  "maKinhNguyet"	INTEGER,
  "maNguoiDung"	TEXT NOT NULL,
  "tbnkn"	INTEGER,
  "ckdn"	INTEGER,  
  "cknn"	INTEGER,
  "snck"	INTEGER,
  "snct"	INTEGER,
  "ngayBatDau"	INTEGER,
  "ngayKetThuc"	INTEGER,
  "ngayBatDauKinh"	INTEGER,
  "ngayKetThucKinh"	INTEGER,
  "ngayBatDauTrung"	INTEGER,
  "ngayKetThucTrung"	INTEGER,
  "trangThai" INTEGER,
  PRIMARY KEY("maKinhNguyet" AUTOINCREMENT),
  FOREIGN KEY("maNguoiDung") REFERENCES "NguoiDung"("maNguoiDung")
)''';

const createThaiKi = '''CREATE TABLE IF NOT EXISTS $tableThaiKi (
  "maThaiKi"	INTEGER,
  "maNguoiDung"	TEXT NOT NULL,
  "ngayQuanHe"	INTEGER,
  "ngayDuSinh"	INTEGER,  
  "ngayTestThuThai"	INTEGER,
  "ketQuaVangDa"	INTEGER,
  "trangThai" INTEGER DEFAULT 0,
  PRIMARY KEY("maThaiKi" AUTOINCREMENT),
  FOREIGN KEY("maNguoiDung") REFERENCES "NguoiDung"("maNguoiDung")
)''';

const createKetQuaTest = '''CREATE TABLE IF NOT EXISTS $tableKetQuaTest (
  "maKetQuaTest"	INTEGER,
  "maLoaiQue"	INTEGER NOT NULL,
  "lanTest"	INTEGER NOT NULL,
  "thoiGian"	INTEGER NOT NULL,
  "ketQua"	INTEGER NOT NULL,
  PRIMARY KEY("maKetQuaTest" AUTOINCREMENT)
)''';

//tạo bảng
const createProduct = '''CREATE TABLE IF NOT EXISTS $tableProduct (
  "maSanPham" INTEGER NOT NULL,
  "soLuong"	INTEGER NOT NULL,
  "trangThai" INTEGER,
  PRIMARY KEY("maSanPham")
)''';
