// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeShowcase extends StatefulWidget {
  final GlobalKey currentKey;
  final GlobalKey? nextKey;
  final String text;
  final Widget container;
  final double heightShowCase;
  final double widthShowCase;
  final double heightContainer;
  final double widthContainer;
  const HomeShowcase({
    Key? key,
    required this.currentKey,
    this.nextKey,
    required this.text,
    required this.container,
    required this.heightShowCase,
    required this.widthShowCase,
    required this.heightContainer,
    required this.widthContainer,
  }) : super(key: key);

  @override
  State<HomeShowcase> createState() => _HomeShowcaseState();
}

class _HomeShowcaseState extends State<HomeShowcase> {
  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      targetBorderRadius: BorderRadius.circular(14),
      disableMovingAnimation: true,
      key: widget.currentKey,
      height: widget.heightShowCase,
      width: widget.widthShowCase,
      container: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 200,
        decoration: const BoxDecoration(
          //color: Colors.yellow,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/union.png',
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: widget.heightContainer,
              width: widget.widthContainer,
              child: Text(
                widget.text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 7),
                  child: TextButton(
                    style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                    ),
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
                    onPressed: () {
                      setState(() {
                        ShowCaseWidget.of(context).dismiss();
                      });
                    },
                  ),
                ),
                Container(
                  width: 90,
                  height: 30,
                  margin: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
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
                        fontSize: 12.5,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (widget.nextKey != null) {
                          ShowCaseWidget.of(context)
                              .startShowCase([widget.nextKey!]);
                        } else {
                          ShowCaseWidget.of(context).dismiss();
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      child: widget.container,
    );
  }
}
