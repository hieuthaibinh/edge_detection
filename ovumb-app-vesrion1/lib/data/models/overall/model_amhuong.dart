class DataAmHuong {
  bool isPlaying;
  String sound;
  String image;
  String title;
  String decbrible;

  DataAmHuong(
      this.isPlaying, this.sound, this.image, this.title, this.decbrible);
}

List<DataAmHuong> dataAmHuong = [
  DataAmHuong(
    false,
    'sounds/dau.mp3',
    'assets/images/babau1.png',
    'Tiếng gọi từ cuộc sống mới',
    'Nhạc thai giáo 3 tháng đầu, giúp bé kích thích trí thông minh và dễ ngủ',
  ),
  DataAmHuong(
    false,
    'sounds/giua.mp3',
    'assets/images/babau2.png',
    'Tiếng gọi từ cuộc sống mới',
    'Nhạc thai giáo 3 tháng giữa, giúp bé kích thích trí thông minh và dễ ngủ',
  ),
  DataAmHuong(
    false,
    'sounds/cuoi.mp3',
    'assets/images/babau3.png',
    'Tiếng gọi từ cuộc sống mới',
    'Nhạc thai giáo 3 tháng cuối, giúp bé kích thích trí thông minh và dễ ngủ',
  ),
];
