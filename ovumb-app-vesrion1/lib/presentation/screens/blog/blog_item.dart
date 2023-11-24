// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_webview.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class BlogItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final DateTime date;
  final String link;
  const BlogItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String convertDate(DateTime date) {
      return '${date.day}/${date.month}/${date.year}';
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BlogWebView.routeName, arguments: link);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
        height: 130,
        width: 350,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: grey300.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                scale: 1,
                fit: BoxFit.cover,
                height: 130,
                width: 160,
              ),
            ),
            Expanded(
              child: Container(
                height: 130,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: grey700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: grey500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(
                          text: convertDate(date),
                          fontWeight: FontWeight.w500,
                          size: 10,
                          color: rose400,
                        ),
                        Image.asset(
                          'assets/icons/blog_next.png',
                          scale: 3,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
