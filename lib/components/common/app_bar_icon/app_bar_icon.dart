import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const AppBarIcon({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        color: Colors.white,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}