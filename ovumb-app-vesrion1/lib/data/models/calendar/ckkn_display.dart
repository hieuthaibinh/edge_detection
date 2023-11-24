
// dữ liệu của chu kì kinh đã quay xử lí
class CKKNDisplay {

  final int snkcl; // số ngày kinh còn lại
  final int sntcl; // số ngày trứng còn lại 
  final List<String> titleKinh; // title của kinh
  final List<String> titleTrung; // titlte của trứng
  final List<String> subKinh; // subtitle của kinh
  final List<String> subTrung; // subtitle của trứng
  final double kinhPercent; // tỉ lệ kinh
  final double trungPercent; // tỉ lệ trứng

  CKKNDisplay(
    this.snkcl,
    this.sntcl,
    this.titleKinh,
    this.titleTrung,
    this.subKinh,
    this.subTrung,
    this.kinhPercent,
    this.trungPercent,
  );
}
