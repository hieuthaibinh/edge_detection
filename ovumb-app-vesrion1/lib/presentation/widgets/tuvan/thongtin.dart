import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/nguoidung/tvv.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/blog/blog_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/shimmer/avatar_shimmer.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/rating_dialog.dart';

// ignore: must_be_immutable
class Thongtin extends StatelessWidget {
  TVV tvv;
  Thongtin({
    super.key,
    required this.tvv,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(1, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              Container(
                height: 90,
                width: 90,
                child: CachedNetworkImage(
                  imageUrl: tvv.linkAnh,
                  placeholder: (context, url) => getShimmer(AvatarShimmer()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chuyên gia ' + tvv.tenTvv,
                        style: TextStyle(
                          color: grey600,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Chuyên gia hỗ trợ sinh sản',
                        style: TextStyle(
                          color: grey500,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0AAC99),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Sẵn sàng giúp đỡ',
                            style: TextStyle(
                              color: Color(0xff0AAC99),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(color: grey200, height: 0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        ratingDialog(context, tvv);
                      },
                      child: Image.asset(
                        'assets/images/sao.png',
                        scale: 3,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      tvv.rating.toString(),
                      style: TextStyle(
                        color: grey600,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/hoc.png',
                      scale: 3,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${tvv.kinhNghiem} năm kinh nghiệm',
                      style: TextStyle(
                        color: grey600,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
