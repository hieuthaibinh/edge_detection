class DataBangTiemChung {
  String tenmuitiem;
  String chitietmuitiem;
  int somuidatiem;
  bool isCheckbox;

  DataBangTiemChung(
    this.tenmuitiem,
    this.chitietmuitiem, 
    this.somuidatiem,
    this.isCheckbox,
  );
}

List<DataBangTiemChung> dataBangTiemChung = [
  DataBangTiemChung(
    'Tiêm mũi 3',
    'Chi tiết tiêm mũi 3',
    0,
    false,
  ),
  DataBangTiemChung(
    'Tiêm mũi 2',
    'Chi tiết tiêm mũi 2',
    0,
    false,
  ),
  DataBangTiemChung(
    'Tiêm mũi 1',
    'Chi tiết tiêm mũi 1',
    0,
    false,
  ),
];
