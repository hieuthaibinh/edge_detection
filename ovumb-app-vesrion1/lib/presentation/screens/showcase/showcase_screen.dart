import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:lottie/lottie.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: ShowCaseWidget(
          builder: Builder(
            builder: ((context) => const Show()),
          ),
        ),
      ),
    );
  }
}

class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) =>
          ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Showcase(
          key: _one,
          description: 'Leading ',
          child: const Icon(Icons.access_alarm),
        ),
        title: Showcase(
          key: _two,
          description: 'Title',
          child: const Text(
            'Show case widget',
          ),
        ),
        actions: [
          Showcase.withWidget(
            disableMovingAnimation: true,
            key: _three,
            height: 200,
            width: 100,
            container: Column(
              children: [
                SizedBox(
                  //color: Colors.yellow,
                  height: 200,
                  width: 100,
                  child: Lottie.asset('assets/images/arrow_lottie.json'),
                ),
                Container(
                  //color: Colors.red,
                  decoration: BoxDecoration(border: Border.all()),
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                    ),
                    child: const Text(
                      'Miêu tả',
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  color: Colors.brown,
                  height: 50,
                  width: 100,
                  child: const Text(
                    'SKIP',
                  ),
                ),
              ],
            ),
            child: const SizedBox(
              //button
              //color: Colors.green,
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: Showcase(
        key: _four, // thứ tự hiện thị
        description: 'floatingActionButton', // mô tả
        tooltipBackgroundColor: Colors.green,
        tooltipPosition: TooltipPosition.top,
        child: FloatingActionButton(
          // nút cần mô tả
          child: const Icon(Icons.accessibility_new),
          onPressed: () {},
        ),
      ),
    );
  }
}
