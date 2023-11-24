// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ovumb_app_version1/data/model_trieuchung.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/connnnn.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/trieuchung.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_event.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class TrieuChungScreen extends StatefulWidget {
  final Con con;
  final TrieuChung? trieuChung;
  const TrieuChungScreen({
    Key? key,
    required this.con,
    required this.trieuChung,
  }) : super(key: key);

  @override
  State<TrieuChungScreen> createState() => _TrieuChungScreenState();
}

class _TrieuChungScreenState extends State<TrieuChungScreen> {
  MilkRepository _milkRepository = MilkRepository();

  List<DataTrieuChung> dataTrieuChung = [
    DataTrieuChung(
      'Dấu hiệu của da',
      [
        'assets/images/vangda.png',
        'assets/images/domda.png',
        'assets/images/mando.png',
        'assets/images/langben.png',
      ],
      [
        'Vàng da',
        'Chàm da',
        'Mẩn đỏ',
        'Lang ben',
      ],
      [
        false,
        false,
        false,
        false,
      ],
    ),
    DataTrieuChung(
      'Dấu hiệu của răng',
      [
        'assets/images/vang.png',
        'assets/images/cua.png',
        'assets/images/lech.png',
        'assets/images/monrang.png',
        'assets/images/moccham.png',
      ],
      [
        'Vàng',
        'Cưa',
        'Lệch',
        'Mòn răng',
        'Mọc chậm',
      ],
      [
        false,
        false,
        false,
        false,
        false,
      ],
    ),
    DataTrieuChung(
      'Dấu hiệu của nước tiểu',
      [
        'assets/images/dinhieu.png',
        'assets/images/cam.png',
        'assets/images/dodam.png',
        'assets/images/xanh.png',
      ],
      [
        'Vàng nhạt',
        'Vàng đậm',
        'Lẫn máu',
        'Xanh rêu',
      ],
      [
        false,
        false,
        false,
        false,
      ],
    ),
    DataTrieuChung(
      'Dấu hiệu của phân',
      [
        'assets/images/nhay.png',
        'assets/images/bot.png',
        'assets/images/xanh1.png',
        'assets/images/muichua.png',
        'assets/images/hoaca.png',
      ],
      [
        'Nhầy',
        'Bọt',
        'Xanh rêu',
        'Mùi chua',
        'Hoa cà hoa cải',
      ],
      [
        false,
        false,
        false,
        false,
        false,
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initTrieuChung();
  }

  void _initTrieuChung() {
    if (widget.trieuChung != null) {
      List<String> lists = widget.trieuChung!.dauHieu!.split(';');
      lists.removeLast();
      if (lists.isNotEmpty) {
        for (int i = 0; i < dataTrieuChung.length; i++) {
          for (int j = 0; j < dataTrieuChung[i].isClick.length; j++) {
            if (lists.contains(dataTrieuChung[i].text[j])) {
              dataTrieuChung[i].isClick[j] = true;
            }
          }
        }
      }
      setState(() {});
    }
  }

  String _textTrieuChung() {
    String text = '';
    dataTrieuChung.forEach((e) {
      for (int i = 0; i < e.image.length; i++) {
        if (e.isClick[i]) {
          text += e.text[i] + ';';
        }
      }
    });
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 25, right: 25),
        height: size.height,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 60,
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Triệu chứng bất thường',
                    style: TextStyle(
                      color: grey700,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Nhập các triệu chứng bất thường của con nếu có theo các mục dưới đây',
                    style: TextStyle(
                      color: grey400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 570,
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataTrieuChung.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.topLeft,
                        width: size.width,
                        child: Text(
                          dataTrieuChung[index].title,
                          style: TextStyle(
                            color: grey600,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.topLeft,
                        width: size.width,
                        height: 90,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: dataTrieuChung[index].image.length,
                          itemBuilder: (context, i) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 65,
                                  height: 70,
                                  margin: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: IconButton(
                                    icon: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color:
                                                dataTrieuChung[index].isClick[i]
                                                    ? rose400
                                                    : Colors.transparent),
                                      ),
                                      child: Image.asset(
                                        dataTrieuChung[index].image[i],
                                      ),
                                    ),
                                    onPressed: () {
                                      dataTrieuChung[index].isClick[i] =
                                          !dataTrieuChung[index].isClick[i];
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Text(
                                  dataTrieuChung[index].text[i],
                                  style: TextStyle(
                                    color: grey500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight,
                    colors: [
                      rose600,
                      rose400,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(38),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                onPressed: () async {
                  if (_textTrieuChung() != '') {
                    LoadingLogo().show(context: context);
                    bool check = await _milkRepository.insertTrieuChung(
                      trieuChung: TrieuChung(
                        id: 0,
                        dauHieu: _textTrieuChung(),
                        id_con: widget.con.id,
                      ),
                    );
                    LoadingLogo().hide();
                    if (check) {
                      Navigator.pop(context);
                      context.read<MilkBloc>().add(CheckBabyExistEvent());
                      showToast(
                        context,
                        'Triệu chứng của bé đã được thêm thành công',
                        seconds: 3,
                      );
                    } else {
                      showErrorDialog(context,
                          'Thêm không thành công. Vui lòng kiểm tra lại kết nối mạng');
                    }
                  } else {
                    showToast(context, 'Bạn chưa chọn triệu chứng');
                  }
                },
                style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Xác nhận',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: rose25,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2);
  final double x;
  final double y1;
  final double y2;
}
