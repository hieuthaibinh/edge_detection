// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_ovumb_app_version1/data/enum/choan_enum.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/choan.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/hutsua.dart';
import 'package:flutter_ovumb_app_version1/data/models/phase3/phattriencon.dart';
import 'package:flutter_ovumb_app_version1/data/repositories/milk/milk_repository.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/primary_font.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/bieudotimeline_widget.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/remove_choan.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/toast.dart';

class HistoryModalBottom extends StatefulWidget {
  ChoAnEnum choAnEnum;
  List<TimelineDetail> timelines;
  ChoAn? choAn;
  num? canNang;
  num? chieuCao;
  HutSua? hutSua;
  TextEditingController listenChangeController;
  int maCon;
  DateTime? date;
  int? ml;

  HistoryModalBottom({
    Key? key,
    required this.choAnEnum,
    required this.timelines,
    this.choAn,
    this.canNang,
    this.chieuCao,
    this.hutSua,
    required this.listenChangeController,
    required this.maCon,
    this.date,
    this.ml,
  }) : super(key: key);

  @override
  State<HistoryModalBottom> createState() => _HistoryModalBottomState();
}

class _HistoryModalBottomState extends State<HistoryModalBottom> {
  FocusNode _focusNode = FocusNode();
  List<String> listPhatTrien = ['Cân nặng', 'Chiều cao'];
  List<String> listBuMe = ['Ngực trái', 'Ngực phải'];
  List<String> listBuBinh = ['Sữa công thức', 'Sữa mẹ'];
  List<String> listAnDam = ['Ăn dặm'];
  MilkRepository _milkRepository = MilkRepository();
  TextEditingController _donViController = TextEditingController(text: 'ml');
  String? valueDropdown;
  late TextEditingController _controller;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String _buildTitle() {
    if (widget.choAnEnum == ChoAnEnum.phattrien) {
      return 'Phát triển';
    } else if (widget.choAnEnum == ChoAnEnum.bume) {
      return 'Bú mẹ';
    } else if (widget.choAnEnum == ChoAnEnum.suacongthuc) {
      return 'Bú bình';
    } else if (widget.choAnEnum == ChoAnEnum.andam) {
      return 'Ăn dặm';
    } else {
      return 'Kích sữa';
    }
  }

  String _buildSubTitle() {
    if (widget.choAnEnum == ChoAnEnum.phattrien) {
      return 'Chỉnh sửa cân nặng, chiều cao của bé';
    } else if (widget.choAnEnum == ChoAnEnum.andam) {
      return 'Chỉnh sửa lượng thức ăn của bé';
    }
    return 'Chỉnh sửa lượng sữa cho con bú';
  }

  String _buildDonVi() {
    if (widget.choAnEnum == ChoAnEnum.phattrien) {
      if (valueDropdown == 'Cân nặng') {
        _donViController.text = 'kg';
        return 'kg';
      } else {
        _donViController.text = 'cm';
        return 'cm';
      }
    } else if (widget.choAnEnum == ChoAnEnum.andam) {
      _donViController.text = 'gam';
      return 'gam';
    } else if (widget.choAnEnum == ChoAnEnum.bume) {
      _donViController.text = 'phút';
      return 'phút';
    } else {
      _donViController.text = 'ml';
      return 'ml';
    }
  }

  List<String> _buildDropdown() {
    List<String> list = [];
    if (widget.choAnEnum == ChoAnEnum.phattrien) {
      list.addAll(listPhatTrien);
      return list;
    } else if (widget.choAnEnum == ChoAnEnum.bume ||
        widget.choAnEnum == ChoAnEnum.hutsua) {
      list.addAll(listBuMe);
      return list;
    } else if (widget.choAnEnum == ChoAnEnum.suacongthuc) {
      list.addAll(widget.timelines.map((e) => e.text));
      valueDropdown = list.first;
      return list;
    } else {
      valueDropdown = listAnDam.first;
      return listAnDam;
    }
  }

  int _parseMinutes(num value) {
    int minutes = value.toInt() * 10;
    int m = (minutes / 60).round();
    return m;
  }

  Future<bool> _updateHutSua() async {
    if (widget.choAnEnum == ChoAnEnum.hutsua) {
      num val1 = 0;
      num val2 = 0;
      if (valueDropdown == 'Ngực trái') {
        val1 = num.tryParse(_controller.text)!;
        val2 = widget.hutSua!.vuPhai ?? 0;
      } else {
        val1 = widget.hutSua!.vuTrai ?? 0;
        val2 = num.tryParse(_controller.text)!;
      }
      return _checkValueHutSua(val1, val2, widget.hutSua!.id!);
    }
    return false;
  }

  Future<bool> _updateTrongLuong() async {
    if (widget.choAnEnum == ChoAnEnum.bume) {
      num val1 = 0;
      num val2 = 0;
      if (valueDropdown == 'Ngực trái') {
        val1 = num.tryParse(_controller.text)! * 60 / 10;
        val2 = widget.choAn!.vuPhai ?? 0;
      } else {
        val1 = widget.choAn!.vuTrai ?? 0;
        val2 = num.tryParse(_controller.text)! * 60 / 10;
      }
      num total = val1 + val2;
      return _checkValueSua(val1, val2, total);
    } else {
      num? val1 = widget.choAn!.vuTrai;
      num? val2 = widget.choAn!.vuPhai;
      num total = num.tryParse(_controller.text)!;
      if (widget.choAnEnum == ChoAnEnum.suacongthuc) {
        return _checkValueSua(val1, val2, total);
      } else {
        return _checkValueAnDam(val1, val2, total);
      }
    }
  }

  Future<bool> _deleteChoAn() async {
    LoadingLogo().show(context: context);
    bool check =
        await _milkRepository.deleteChoAn(maChoAn: widget.choAn!.maChoAn!);
    LoadingLogo().hide();
    if (check) {
      showToast(context, 'Xóa dữ liệu thành công');
      return true;
    } else {
      showToast(
          context, 'Xóa dữ liệu không thành công. Kiểm tra lại kết nối mạng');
      return false;
    }
  }

  Future<bool> _deleteHutSua() async {
    LoadingLogo().show(context: context);
    bool check = await _milkRepository.deleteHutSua(id: widget.hutSua!.id!);
    LoadingLogo().hide();
    if (check) {
      showToast(context, 'Xóa dữ liệu thành công');
      return true;
    } else {
      showToast(
          context, 'Xóa dữ liệu không thành công. Kiểm tra lại kết nối mạng');
      return false;
    }
  }

  Future<bool> _updatePhatTrien() async {
    try {
      num? canNang = widget.canNang;
      num? chieuCao = widget.chieuCao;
      if (valueDropdown == 'Cân nặng') {
        canNang = num.tryParse(_controller.text);
      } else {
        chieuCao = num.tryParse(_controller.text);
      }
      if (canNang! > 20) {
        showToast(context, 'Cân nặng không được vượt quá 20kg');
        return false;
      }
      if (chieuCao! > 150) {
        showToast(context, 'Chiều cao không được vượt quá 150cm');
        return false;
      }
      LoadingLogo().show(context: context);
      bool check = await _milkRepository.insertPhatTrien(
        phatTrienCon: PhatTrienCon(
          maCon: widget.maCon,
          canNang: canNang,
          chieuCao: chieuCao,
          thoiGian: widget.date,
        ),
      );
      LoadingLogo().hide();
      if (check) {
        showToast(context, 'Lưu dữ liệu thành công');
        return true;
      } else {
        showToast(
            context, 'Lưu dữ liệu không thành công. Kiểm tra lại kết nối mạng');
        return false;
      }
    } catch (e) {
      showToast(context, 'Không được chứ kí tự. Vui lòng nhập lại');
      return false;
    }
  }

  Future<bool> _checkValueHutSua(num? val1, num? val2, int id) async {
    if ((val1 ?? 0) + (val2 ?? 0) > 1200) {
      showToast(context, 'Tổng lượng sữa không được lớn hơn 1200ml');
      return false;
    } else {
      LoadingLogo().show(context: context);
      bool check = await _milkRepository.updateHutSua(
        id: id,
        vuTrai: val1,
        vuPhai: val2,
      );
      LoadingLogo().hide();
      if (check) {
        showToast(context, 'Lưu thành công');
        return true;
      } else {
        showToast(
            context, 'Lưu sửa không thành công. Kiểm tra lại kết nối mạng');
        return false;
      }
    }
  }

  Future<bool> _checkValueSua(num? val1, num? val2, num total) async {
    if (widget.choAnEnum == ChoAnEnum.bume && (val1! > 360 || val2! > 360)) {
      showToast(context, 'Thời gian không được vượt quá 60 phút');
      return false;
    } else if (widget.choAnEnum != ChoAnEnum.bume && total > 600) {
      showToast(context, 'Tổng lượng sữa không được lớn hơn 600ml');
      return false;
    } else {
      LoadingLogo().show(context: context);
      bool check = await _milkRepository.updateTrongLuong(
        maChoAn: widget.choAn!.maChoAn!,
        trongLuong: total,
        vuTrai: val1,
        vuPhai: val2,
      );
      LoadingLogo().hide();
      if (check) {
        showToast(context, 'Lưu thành công');
        return true;
      } else {
        showToast(
            context, 'Lưu sửa không thành công. Kiểm tra lại kết nối mạng');
        return false;
      }
    }
  }

  Future<bool> _checkValueAnDam(num? val1, num? val2, num total) async {
    if (total > 1000) {
      showToast(context, 'Tổng lượng thức ăn không được lớn hơn 1000gam');
      return false;
    } else {
      LoadingLogo().show(context: context);
      bool check = await _milkRepository.updateTrongLuong(
        maChoAn: widget.choAn!.maChoAn!,
        trongLuong: total,
        vuTrai: val1,
        vuPhai: val2,
      );
      LoadingLogo().hide();
      if (check) {
        showToast(context, 'Lưu dữ liệu thành công');
        return true;
      } else {
        showToast(
            context, 'Lưu dữ liệu không thành công. Kiểm tra lại kết nối mạng');
        return false;
      }
    }
  }

  void _initial() {
    if (widget.choAnEnum == ChoAnEnum.phattrien) {
      _controller = TextEditingController(text: widget.canNang.toString());
      valueDropdown = 'Cân nặng';
    } else if (widget.choAnEnum == ChoAnEnum.bume) {
      _controller = TextEditingController(
          text: _parseMinutes(widget.choAn!.vuTrai!).toString());
      valueDropdown = 'Ngực trái';
    } else if (widget.choAnEnum == ChoAnEnum.hutsua) {
      _controller =
          TextEditingController(text: widget.hutSua!.vuTrai.toString());
      valueDropdown = 'Ngực trái';
    } else if (widget.choAnEnum == ChoAnEnum.suacongthuc) {
      _controller = TextEditingController(text: widget.ml.toString());
    } else {
      _controller = TextEditingController(text: widget.ml.toString());
    }
  }

  @override
  void initState() {
    _initial();
    _buildDonVi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 470,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      width: screenSize.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: _buildTitle(),
                    fontWeight: FontWeight.w600,
                    size: 20,
                    color: greyText,
                  ),
                  TitleText(
                    text: _buildSubTitle(),
                    fontWeight: FontWeight.w400,
                    size: 16,
                    color: grey500,
                  ),
                ],
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/icons/x_icon.png',
                  scale: 3,
                  color: grey500,
                ),
              )
            ],
          ),
          Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 100,
                child: TextFormField(
                  focusNode: _focusNode,
                  onTapOutside: (event) {
                    _focusNode.unfocus();
                  },
                  textAlign: TextAlign.center,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly // Chỉ cho phép nhập số
                  ],
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: grey500,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                  controller: _controller,
                  decoration: InputDecoration(
                    //contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: grey500,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 80,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: false,
                  enabled: false,
                  onTapOutside: (event) {},
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: grey500,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  controller: _donViController,
                  decoration: InputDecoration(
                    //contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
          Divider(height: 30),
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: ButtonTheme(
              padding: EdgeInsets.zero,
              alignedDropdown: true,
              child: DropdownButtonFormField2<String>(
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusColor: Colors.transparent,
                isExpanded: true,
                dropdownMaxHeight: 200,
                iconSize: 30,
                buttonHeight: 50,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                dropdownOverButton: false,
                items: _buildDropdown()
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: PrimaryFont.medium(16, FontWeight.w500)
                              .copyWith(color: greyText),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  if (widget.choAnEnum == ChoAnEnum.phattrien) {
                    if (value == 'Cân nặng') {
                      valueDropdown = 'Cân nặng';
                      _controller.text = widget.canNang.toString();
                      _buildDonVi();
                    } else {
                      valueDropdown = 'Chiều cao';
                      _controller.text = widget.chieuCao.toString();
                      _buildDonVi();
                    }
                  } else if (widget.choAnEnum == ChoAnEnum.bume) {
                    if (value == 'Ngực trái') {
                      valueDropdown = 'Ngực trái';
                      if (widget.choAn!.vuTrai == null ||
                          widget.choAn!.vuTrai == 0) {
                        _controller.text = '0';
                      } else {
                        _controller.text =
                            _parseMinutes(widget.choAn!.vuTrai!).toString();
                      }
                    } else {
                      valueDropdown = 'Ngực phải';
                      if (widget.choAn!.vuPhai == null ||
                          widget.choAn!.vuPhai == 0) {
                        _controller.text = '0';
                      } else {
                        _controller.text =
                            _parseMinutes(widget.choAn!.vuPhai!).toString();
                      }
                    }
                    setState(() {});
                  } else if (widget.choAnEnum == ChoAnEnum.hutsua) {
                    if (value == 'Ngực trái') {
                      valueDropdown = 'Ngực trái';
                      if (widget.hutSua!.vuTrai == null ||
                          widget.hutSua!.vuTrai == 0) {
                        _controller.text = '0';
                      } else {
                        _controller.text = widget.hutSua!.vuTrai.toString();
                      }
                    } else {
                      valueDropdown = 'Ngực phải';
                      if (widget.hutSua!.vuPhai == null ||
                          widget.hutSua!.vuPhai == 0) {
                        _controller.text = '0';
                      } else {
                        _controller.text = widget.hutSua!.vuPhai.toString();
                      }
                    }
                  }
                },
                onMenuStateChange: (isOpen) {},
                value: _buildDropdown().first,
                decoration: InputDecoration(
                  isDense: true,
                  focusColor: rose400,
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(38),
                    borderSide: const BorderSide(
                      color: rose300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(38),
                    borderSide: const BorderSide(
                      color: rose300,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(38),
                    borderSide: const BorderSide(
                      color: grey300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
                colors: [
                  violet600,
                  violet600,
                ],
              ),
              borderRadius: BorderRadius.circular(38),
            ),
            child: ElevatedButton(
              onPressed: () async {
                if (_controller.text != '') {
                  if (widget.choAnEnum == ChoAnEnum.phattrien) {
                    bool check = await _updatePhatTrien();
                    if (check) {
                      widget.listenChangeController.text = getRandomString(5);
                      Navigator.pop(context);
                    }
                  } else if (widget.choAnEnum == ChoAnEnum.hutsua) {
                    bool check = await _updateHutSua();
                    if (check) {
                      widget.listenChangeController.text = getRandomString(5);
                      Navigator.pop(context);
                    }
                  } else {
                    bool check = await _updateTrongLuong();
                    if (check) {
                      widget.listenChangeController.text = getRandomString(5);
                      Navigator.pop(context);
                    }
                  }
                } else {
                  showToast(context, 'Bạn chưa nhập giá trị');
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
                  fixedSize:
                      MaterialStatePropertyAll(Size(screenSize.width, 50))),
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
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
            ),
            child: ElevatedButton(
              onPressed: () {
                _controller.text = '0';
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                      side: BorderSide(color: grey300),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0),
                  fixedSize:
                      MaterialStatePropertyAll(Size(screenSize.width, 50))),
              child: Text(
                'Hủy',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: grey500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (widget.choAnEnum != ChoAnEnum.phattrien) ...[
            InkWell(
              onTap: () async {
                bool? check = await removeChoAnDialog(context);
                if (check == true) {
                  if (widget.choAnEnum != ChoAnEnum.hutsua) {
                    bool delete = await _deleteChoAn();
                    if (delete) {
                      widget.listenChangeController.text = getRandomString(5);
                      Navigator.pop(context);
                    }
                  } else {
                    bool delete = await _deleteHutSua();
                    if (delete) {
                      widget.listenChangeController.text = getRandomString(5);
                      Navigator.pop(context);
                    }
                  }
                }
              },
              child: Container(
                height: 50,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/trash.png',
                      scale: 3,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Xóa dữ liệu',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: rose500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
