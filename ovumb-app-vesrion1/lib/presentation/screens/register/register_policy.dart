import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class RegisterPolicyWebview extends StatefulWidget {
  static const routeName = 'register-policy-webview';
  final String url;
  const RegisterPolicyWebview({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<RegisterPolicyWebview> createState() => _RegisterPolicyWebviewState();
}

class _RegisterPolicyWebviewState extends State<RegisterPolicyWebview> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Scaffold(
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
            text: 'Chính sách & Bảo mật',
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