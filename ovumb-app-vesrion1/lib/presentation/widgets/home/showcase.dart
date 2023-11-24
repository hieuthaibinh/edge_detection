import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_showcase.dart';

class ShowcaseWidget extends StatefulWidget {
  final int titleId;
  const ShowcaseWidget({super.key, required this.titleId});

  @override
  State<ShowcaseWidget> createState() => _ShowcaseWidgetState();
}

class _ShowcaseWidgetState extends State<ShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 41),
            //color: Colors.green,
            alignment: Alignment.center,
            height: 65,
            width: 170,
            child: Column(
              children: [
                if (dataShowcase[widget.titleId].id == 0) ...[
                  Text(
                    dataShowcase[0].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else if (dataShowcase[widget.titleId].id == 1) ...[
                  Text(
                    dataShowcase[1].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else if (dataShowcase[widget.titleId].id == 2) ...[
                  Text(
                    dataShowcase[2].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else if (dataShowcase[widget.titleId].id == 3) ...[
                  Text(
                    dataShowcase[3].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else if (dataShowcase[widget.titleId].id == 4) ...[
                  Text(
                    dataShowcase[4].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: TextButton(
                  child: const Text(
                    'Bỏ qua',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: 90,
                height: 30,
                margin: const EdgeInsets.only(left: 25, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  //border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Tiếp tục',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    if (dataShowcase[widget.titleId].id == 0) {
                    } else if (dataShowcase[widget.titleId].id == 1) {
                    } else if (dataShowcase[widget.titleId].id == 2) {
                    } else if (dataShowcase[widget.titleId].id == 3) {
                    } else if (dataShowcase[widget.titleId].id == 4) {}
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
 Showcase.withWidget(
                      targetBorderRadius: BorderRadius.circular(14),
                      disableMovingAnimation: true,
                      key: _one,
                      height: 80,
                      width: 120,
                      child: HalfContainer(
                        size: size,
                        gradientFrom: primaryColorViolet800,
                        gradientTo: primaryColorViolet500,
                        title: 'Tham gia Miễn Phí',
                        sub: 'Cộng Đồng Sinh Con Theo Ý Muốn',
                        image: 'assets/images/gender_image.png',
                      ),
                      container: Container(
                        height: 180,
                        width: 200,
                        decoration: BoxDecoration(
                          //color: Colors.yellow,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/union.png',
                            ),
                          ),
                        ),
                        child: ShowcaseWidget(
                          titleId: dataShowcase[0].id,
                        ),
                      ),
                    ),
 */