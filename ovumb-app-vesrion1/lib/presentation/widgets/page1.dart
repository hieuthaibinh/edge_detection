// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/enum/test_enum.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import '../../data/model_manhuongdan.dart';

class Page1 extends StatefulWidget {
  final int index;
  final String? video;
  final String image;
  const Page1({
    Key? key,
    required this.index,
    this.video,
    required this.image,
  }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool isPlayVideo = false;
  late VideoPlayerController s1;

  @override
  void initState() {
    if (widget.video != null) {
      try {
        s1 = VideoPlayerController.network(widget.video!)
          ..initialize().then(
            (value) {
              s1.setLooping(true);
              if (s1.value.isInitialized && !s1.value.isPlaying) {
                isPlayVideo = true;
                s1.play();
                setState(() {});
              }
            },
          );
      } catch (e) {
        print('Error initializing video player: $e');
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    s1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              dataManHuongDanTest[widget.index].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Palette.primaryColorRose500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                dataManHuongDanTest[widget.index].describle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Palette.text,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.blue,
              child: dataManHuongDanTest[widget.index].testEnum ==
                      TestEnum.video
                  ? isPlayVideo
                      ? AspectRatio(
                          aspectRatio: s1.value.aspectRatio,
                          child: VideoPlayer(
                            s1,
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: widget.image,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                  : CachedNetworkImage(
                      imageUrl: widget.image,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
