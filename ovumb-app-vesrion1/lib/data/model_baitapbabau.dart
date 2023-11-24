class DataBaiTapBaBau {
  final int id;
  final String imageAsset;
  final String title;
  final String text;
  final String linkYoutube;

  DataBaiTapBaBau(
      this.id, this.imageAsset, this.title, this.text, this.linkYoutube);
}

List<DataBaiTapBaBau> dataBaiTapBaBau = [
  DataBaiTapBaBau(
    0,
    'assets/images/yoga1.jpg',
    'Bài tập cho bà bầu 1',
    'Bài tập cho bà bầu 1',
    'https://www.youtube.com/watch?v=K2APohWmlis',
  ),
  DataBaiTapBaBau(
    1,
    'assets/images/yoga2.jpg',
    'Bài tập cho bà bầu 2',
    'Bài tập cho bà bầu 2',
    'https://www.youtube.com/watch?v=dMxL5bThwbo',
  ),
  DataBaiTapBaBau(
    2,
   'assets/images/yoga3.jpg',
    'Bài tập cho bà bầu 3',
    'Bài tập cho bà bầu 3',
    'https://www.youtube.com/watch?v=21SJ2EclGiU',
  ),
];
