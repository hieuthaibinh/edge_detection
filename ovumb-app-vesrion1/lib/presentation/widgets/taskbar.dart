import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Taskbar extends StatefulWidget {
  const Taskbar({super.key});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  String formattedDateTime = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height / 11,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.transparent)],
      ),
      child: Row(
        children: [
          const Expanded(
            child: BackButton(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                formattedDateTime,
                style: const TextStyle(
                  color: Color(0xff333e52),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          const Expanded(
            child: MenuButton(),
          ),
        ],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      child: ElevatedButton.icon(
        icon: Image.asset(
          'assets/icons/back_button.png',
          scale: 3,
        ),
        onPressed: () {
          //Navigator.pop(context);
        },
        label: const Text(''),
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          shadowColor: MaterialStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.centerRight,
        color: Colors.white,
        child: ElevatedButton.icon(
          icon: const ImageIcon(
            AssetImage('assets/icons/menu.png'),
            color: Color(0xfffd6f8e),
          ),
          onPressed: () {},
          label: const Text(''),
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
