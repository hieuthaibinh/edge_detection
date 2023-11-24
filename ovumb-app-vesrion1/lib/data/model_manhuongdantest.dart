class DataManHuongDanTest {
  int id;
  String title;
  String describle;
  String imageAsset;

  DataManHuongDanTest(this.id, this.title, this.describle, this.imageAsset);
}

List<DataManHuongDanTest> dataManHuongDanTest = [
  DataManHuongDanTest(0, 'STEP 1', 'Đặt que vào khay test', 'assets/images/anh1.png'),
  DataManHuongDanTest(1, 'STEP 2', 'Đưa camera trên mặt khay, để AI nhận diện ô test và chụp', 'assets/images/anh2.png'),
  DataManHuongDanTest(2, 'STEP 3', 'Sau khi chụp, bạn có thể chọn dấu tick hoặc chỉnh lại khung nhận diện', 'assets/images/anh3.png'),
  DataManHuongDanTest(3, 'STEP 4', 'Nhận kết quả', 'assets/images/anh4.png'),
];
 