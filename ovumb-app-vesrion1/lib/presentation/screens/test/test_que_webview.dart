// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class TestQueWebView extends StatefulWidget {
  static const routeName = 'test-que-webview';
  final String url;
  const TestQueWebView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<TestQueWebView> createState() => _TestQueWebViewState();
}

class _TestQueWebViewState extends State<TestQueWebView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            color: Color(0xfffd6f8e),
            icon: Image.asset(
              'assets/icons/back_button.png',
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: TitleText(
            text: 'Mua Que Test',
            fontWeight: FontWeight.w600,
            size: 18,
            color: grey700,
          ),
          backgroundColor: whiteColor,
          shadowColor: whiteColor,
          bottomOpacity: 0.1,
          elevation: 3,
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        ),
      ),
    );
  }
}
