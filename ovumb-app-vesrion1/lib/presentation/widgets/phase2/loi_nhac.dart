import 'package:flutter/material.dart';
import 'package:flutter_ovumb_app_version1/data/models/overall/model_detail.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/color.dart';

class LoiNhac extends StatefulWidget {
  const LoiNhac({super.key});

  @override
  State<LoiNhac> createState() => _LoiNhacState();
}

class _LoiNhacState extends State<LoiNhac> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        key: PageStorageKey<String>('page'),
        physics: BouncingScrollPhysics(),
        itemCount: dataDetail.length,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.06),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: rose400,
                  ),
                ),
                Container(
                  height: 50,
                  width: 240,
                  //color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          dataDetail[index].title,
                          style: TextStyle(
                            color: grey700,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          dataDetail[index].describe,
                          style: TextStyle(
                            color: rose400,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
