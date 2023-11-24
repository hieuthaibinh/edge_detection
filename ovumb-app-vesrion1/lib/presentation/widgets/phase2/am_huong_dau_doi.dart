import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_amhuong.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class AmHuongDauDoi extends StatefulWidget {
  const AmHuongDauDoi({super.key});

  @override
  State<AmHuongDauDoi> createState() => _AmHuongDauDoiState();
}

class _AmHuongDauDoiState extends State<AmHuongDauDoi> {
  @override
  void initState() {
    player.stop();
    super.initState();
  }

  @override
  void dispose() async {
    // dừng voice khi thoát ra
    await player.stop();
    super.dispose();
  }

  bool isLoopSound = true;
  String voice = 'voice';
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 400,
      margin: EdgeInsets.only(top: 30),
      //color: Colors.green,
      child: Column(
        key: PageStorageKey<String>('page'),
        children: [
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(dataAmHuong[0].image)),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: dataAmHuong[0].isPlaying
                      ? Image.asset(
                          'assets/images/play.png',
                          scale: 2.5,
                        )
                      : Image.asset(
                          'assets/images/pause.png',
                          scale: 2.5,
                        ),
                  onPressed: () {
                    dataAmHuong[0].isPlaying = !dataAmHuong[0].isPlaying;
                    dataAmHuong[1].isPlaying = false;
                    dataAmHuong[2].isPlaying = false;
                    if (dataAmHuong[0].isPlaying == true) {
                      player.play(AssetSource(dataAmHuong[0].sound));
                      player.setVolume(1);
                    } else {
                      player.stop();
                    }
                    setState(() {});
                  },
                ),
              ),
              Container(
                //color: Colors.amber,
                alignment: Alignment.topLeft,
                height: 90,
                width: size.width * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width * 0.52,
                      child: Text(
                        dataAmHuong[0].title,
                        style: TextStyle(
                          color: grey700,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.52,
                      child: Text(
                        dataAmHuong[0].decbrible,
                        style: TextStyle(
                          color: grey400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(dataAmHuong[1].image)),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: dataAmHuong[1].isPlaying
                      ? Image.asset(
                          'assets/images/play.png',
                          scale: 2.5,
                        )
                      : Image.asset(
                          'assets/images/pause.png',
                          scale: 2.5,
                        ),
                  onPressed: () {
                    dataAmHuong[1].isPlaying = !dataAmHuong[1].isPlaying;
                    dataAmHuong[0].isPlaying = false;
                    dataAmHuong[2].isPlaying = false;
                    if (dataAmHuong[1].isPlaying == true) {
                      player.play(AssetSource(dataAmHuong[1].sound));
                      player.setVolume(1);
                    } else {
                      player.stop();
                    }
                    setState(() {});
                  },
                ),
              ),
              Container(
                //color: Colors.amber,
                alignment: Alignment.topLeft,
                height: 90,
                width: size.width * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width * 0.52,
                      child: Text(
                        dataAmHuong[1].title,
                        style: TextStyle(
                          color: grey700,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.52,
                      child: Text(
                        dataAmHuong[1].decbrible,
                        style: TextStyle(
                          color: grey400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(dataAmHuong[2].image)),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: dataAmHuong[2].isPlaying
                      ? Image.asset(
                          'assets/images/play.png',
                          scale: 2.5,
                        )
                      : Image.asset(
                          'assets/images/pause.png',
                          scale: 2.5,
                        ),
                  onPressed: () {
                    dataAmHuong[2].isPlaying = !dataAmHuong[2].isPlaying;
                    dataAmHuong[0].isPlaying = false;
                    dataAmHuong[1].isPlaying = false;
                    if (dataAmHuong[2].isPlaying == true) {
                      player.play(AssetSource(dataAmHuong[2].sound));
                      player.setVolume(1);
                    } else {
                      player.stop();
                    }
                    setState(() {});
                  },
                ),
              ),
              Container(
                //color: Colors.amber,
                alignment: Alignment.topLeft,
                height: 90,
                width: size.width * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width * 0.52,
                      child: Text(
                        dataAmHuong[2].title,
                        style: TextStyle(
                          color: grey700,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.52,
                      child: Text(
                        dataAmHuong[2].decbrible,
                        style: TextStyle(
                          color: grey400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
