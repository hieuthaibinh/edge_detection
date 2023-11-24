// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/tu_van/tuvan5_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/avatar_shimmer.dart';

class TuVanVienScreen extends StatelessWidget {
  final List<TVV> listTvv;
  const TuVanVienScreen({
    Key? key,
    required this.listTvv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        key: PageStorageKey<String>('page'),
        itemCount: listTvv.length,
        itemBuilder: (BuildContext context, int index) {
          TVV tvv = listTvv[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Tuvan5Screen.routeName,
                arguments: tvv,
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: tvv.linkAnh,
                        placeholder: (context, url) =>
                            getShimmer(AvatarShimmer()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chuyên gia',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: Color(0xff667085),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            tvv.tenTvv,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xff667085),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Palette.title,
                        border: Border.all(color: Palette.title),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Tuvan5Screen.routeName,
                            arguments: tvv,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/chat.png',
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Liên hệ',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: rose25,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
