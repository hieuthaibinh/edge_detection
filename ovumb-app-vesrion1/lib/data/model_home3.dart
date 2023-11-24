
class Home3Infor {
  String title;
  String detail;

  Home3Infor(this.title, this.detail);
}

List<Home3Infor> home3Infor = [
  Home3Infor('Chiều cao', 'cm'),
  Home3Infor('Cân nặng', 'kg'),
  Home3Infor('Giới tính', 'Nam'),
];

class Home3List {
  String image;
  String title;
  String detail;

  Home3List(this.image, this.title, this.detail);
}

List<Home3List> home3List = [
  Home3List(
    'assets/images/ca.png',
    'Cho ăn',
    '0ml-0gam',
  ),
  Home3List(
    'assets/images/pt.png',
    'Phát triển',
    '- - - - -',
  ),
  Home3List(
    'assets/images/tc.png',
    'Triệu chứng',
    '- - - - -',
  ),
];


class Home3Box {
  String image;

  Home3Box(
    this.image,
  );
}

List<Home3Box> home3Box = [
  Home3Box('assets/images/home3_container1.png'),
  Home3Box('assets/images/home3_container2.png'),
];
