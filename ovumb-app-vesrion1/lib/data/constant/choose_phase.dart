// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChoosePhase {
  final String image;
  final String title;
  final String subTitle;
  ChoosePhase({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<ChoosePhase> choosePhase = [
  ChoosePhase(
    image: 'assets/images/radio_image2.png',
    title: 'Tính rụng trứng',
    subTitle: 'Hỗ trợ mang thai',
  ),
  ChoosePhase(
      image: 'assets/images/radio_image1.png',
      title: 'Tính ngày an toàn',
      subTitle: 'Quản lý kỳ kinh'),
  ChoosePhase(
      image: 'assets/images/radio_image4.png',
      title: 'Theo dõi sữa mẹ',
      subTitle: 'Chăm sóc trẻ sơ sinh'),
  ChoosePhase(
    image: 'assets/images/radio_image3.png',
    title: 'Theo dõi Thai kì',
    subTitle: 'Mẹ tròn con vuông',
  ),
];
