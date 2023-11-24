import 'package:flutter/material.dart';

class StoreHomeShimmer extends StatelessWidget {
  const StoreHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: 240,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 335,
          width: size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 30,
                width: size.width,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 180,
                      width: 170,
                      margin: EdgeInsets.only(right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 335,
          width: size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 30,
                width: size.width,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 180,
                      width: 170,
                      margin: EdgeInsets.only(right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
