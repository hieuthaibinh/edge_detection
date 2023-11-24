// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/avatar_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// hiển thị hướng dẫn trong phần lịch
Future<void> ratingDialog(
  BuildContext context,
  TVV tvv,
) {
  return showDialog<void>(
    //barrierColor: Colo,
    context: context,
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: AlertDialog(
          elevation: 0,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          content: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 450,
                width: 320,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.transparent),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff10182814),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      child: CachedNetworkImage(
                        imageUrl: tvv.linkAnh,
                        placeholder: (context, url) =>
                            getShimmer(AvatarShimmer()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      glow: false,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TitleText(
                        text: 'Viết đánh giá',
                        fontWeight: FontWeight.w600,
                        size: 14,
                        color: grey700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            width: 2,
                            color: blue400,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            width: 2,
                            color: blue400,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            width: 2,
                            color: blue400,
                          ),
                        ),
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: TitleText(
                        text: 'Gửi đánh giá',
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: whiteColor,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/icons/exit_dialog.png',
                    scale: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
