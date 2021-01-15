import 'package:flutter/material.dart';

class CircleBackgroundBtn extends StatelessWidget {
  final Function onpressed;
  final Icon icon;
  const CircleBackgroundBtn({
    Key key,
    this.onpressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      child: IconButton(
        icon: icon,
        onPressed: onpressed,
      ),
    );
  }
}
