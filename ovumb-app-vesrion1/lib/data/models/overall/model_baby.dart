import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_baitapbabau.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:url_launcher/url_launcher.dart';

class DataNgay {
  int ngay;

  DataNgay(
    this.ngay,
  );
}

List<DataNgay> ngayList = [
  DataNgay(0),
  DataNgay(0),
];

class DataBaby {
  bool isClickDay;
  int idCheck;
  int id;
  String imageAsset;
  int tuanthai;
  String name;

  DataBaby(this.isClickDay, this.idCheck, this.id, this.imageAsset,
      this.tuanthai, this.name);
}

List<DataBaby> dataBaby = [
  DataBaby(false, 0, 0, 'assets/images/baby0.png', 1, 'hạt vừng'),
  DataBaby(false, 0, 1, 'assets/images/baby1.png', 2, 'quả mâm xôi'),
  DataBaby(false, 0, 2, 'assets/images/baby2.png', 3, 'quả dâu tây'),
  DataBaby(false, 0, 3, 'assets/images/baby3.png', 4, 'quả măng cụt'),
  DataBaby(false, 0, 4, 'assets/images/baby4.png', 5, 'quả cam'),
  DataBaby(false, 0, 5, 'assets/images/baby5.png', 6, 'củ khoai tây'),
  DataBaby(false, 0, 6, 'assets/images/baby6.png', 7, 'quả dưa lê'),
  DataBaby(false, 0, 7, 'assets/images/baby7.png', 8, 'quả đu đủ'),
  DataBaby(false, 0, 8, 'assets/images/baby9.png', 9, 'quả dưa hấu'),
  DataBaby(false, 0, 8, 'assets/images/baby9.png', 9, 'quả dưa hấu'),
];

List<DataBaby> dataBaby1 = [
  DataBaby(false, 0, 0, 'assets/images/baby11.png', 1, 'hạt vừng'),
  DataBaby(false, 0, 1, 'assets/images/baby22.png', 2, 'quả mâm xôi'),
  DataBaby(false, 0, 2, 'assets/images/baby33.png', 3, 'quả dâu tây'),
  DataBaby(false, 0, 3, 'assets/images/baby44.png', 4, 'quả măng cụt'),
  DataBaby(false, 0, 4, 'assets/images/baby55.png', 5, 'quả cam'),
  DataBaby(false, 0, 5, 'assets/images/baby66.png', 6, 'củ khoai tây'),
  DataBaby(false, 0, 6, 'assets/images/baby77.png', 7, 'quả dưa lê'),
  DataBaby(false, 0, 7, 'assets/images/baby88.png', 8, 'quả đu đủ'),
  DataBaby(false, 0, 8, 'assets/images/baby99.png', 9, 'quả dưa hấu'),
  DataBaby(false, 0, 8, 'assets/images/baby99.png', 9, 'quả dưa hấu'),
];

class DataBabyDetail {
  int id;
  String text;
  String values;

  DataBabyDetail(this.id, this.text, this.values);
}

List<DataBabyDetail> dataBabyDetail = [
  DataBabyDetail(0, 'Chiều cao', ' cm'),
  DataBabyDetail(1, 'Cân nặng', ' gr'),
  DataBabyDetail(2, 'Ngày dự sinh', ' ngày'),
];

class DataButton {
  bool isClick;
  double width;
  String title;
  Widget detail;

  DataButton(this.isClick, this.width, this.title, this.detail);
}

List<DataButton> dataButton = [
  DataButton(
    false,
    100,
    'Lời khuyên',
    Text(
        "If it's not what you want - stop and change it. Don't just keep going and expect it will get better. For the lack of a better word I call them hangy downs. I will take some magic white, and a little bit of Vandyke brown and a little touch of yellow."),
  ),
  DataButton(
    false,
    90,
    'Lời nhắc',
    Container(
      height: 500,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        key: PageStorageKey<String>('page'),
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: rose400,
                ),
              ),
              Container(
                height: 50,
                width: 240,
                //color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Uống 1 viên Pregnacare Max ',
                        style: TextStyle(
                          color: grey700,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12:00, Hằng ngày',
                        style: TextStyle(
                          color: rose400,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: rose400),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: rose400,
                ),
              ),
              Container(
                height: 50,
                width: 240,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Uống 1 viên Wellvita E ',
                        style: TextStyle(
                          color: grey700,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '12:00, Hằng ngày',
                        style: TextStyle(
                          color: rose400,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: rose400),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
  DataButton(
    false,
    150,
    'Bài tập cho bà bầu',
    Container(
      //color: Colors.amber,
      height: 400,
      width: 600,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      //color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(dataBaiTapBaBau[index].imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(width: 10),
                  Container(
                    //color: Colors.yellow,
                    height: 70,
                    width: 175,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            dataBaiTapBaBau[index].title,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: grey700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            dataBaiTapBaBau[index].text,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: grey400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Uri url = Uri.parse(dataBaiTapBaBau[index].linkYoutube);
              launchUrl(url, mode: LaunchMode.externalNonBrowserApplication);
            },
          );
        },
      ),
    ),
  ),
  DataButton(
    false,
    150,
    'Hành trang đón bé',
    Container(),
  ),
  DataButton(
    false,
    150,
    'Âm hưởng đầu đời',
    Container(),
  ),
];

class DataId {
  int id;

  DataId(this.id);
}

List<DataId> dataId = [
  DataId(0), //body overall
  DataId(1), //body details
];
