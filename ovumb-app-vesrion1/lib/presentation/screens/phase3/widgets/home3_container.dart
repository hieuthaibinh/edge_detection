// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Home3Container extends StatelessWidget {
  final String image;
  final Widget widget;
  final Widget button;
  final VoidCallback? callback;

  const Home3Container({
    Key? key,
    required this.image,
    required this.widget,
    required this.button,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: callback,
        child: Container(
          padding:
              const EdgeInsets.only(left: 22, right: 22, top: 30, bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              scale: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget,
              button,
            ],
          ),
        ),
      ),
    );
  }
}
