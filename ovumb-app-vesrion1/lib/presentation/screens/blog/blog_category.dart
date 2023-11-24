// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ovumb_app_version1/data/models/blog/blog.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_item.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class BlogCategory extends StatelessWidget {
  final String type;
  final List<Blog> blogs;
  const BlogCategory({
    Key? key,
    required this.type,
    required this.blogs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            type,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: grey900,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          
          height: 180,
          width: screenSize.width,
          child: ListView.builder(
            itemCount: blogs.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BlogItem(
                image: blogs[index].image,
                title: blogs[index].title,
                subTitle: blogs[index].content,
                date: blogs[index].date,
                link: blogs[index].link,
              );
            },
          ),
        ),
      ],
    );
  }
}
