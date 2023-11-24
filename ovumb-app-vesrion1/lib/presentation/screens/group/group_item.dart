import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/model_launch_url.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/title_text.dart';

class GroupItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final int member;
  final String link;
  const GroupItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.member,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String convertMember(int member) {
      double res = member / 1000;
      return res.toString() + "K" + " Thành viên";
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          height: 60,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12 ),
                child: Image.network(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: greyText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      convertMember(member),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: grey200),
                    borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  onTap: () async {
                    await LaunchUrl.web(
                      context: context,
                      tenLink: link,
                      maLink: 0,
                    );
                  },
                  child: Center(
                    child: TitleText(
                      text: 'Tham gia',
                      fontWeight: FontWeight.w400,
                      size: 12,
                      color: violet600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
