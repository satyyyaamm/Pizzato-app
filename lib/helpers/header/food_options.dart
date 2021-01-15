import 'package:flutter/material.dart';

class FoodOptions extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final Function onpressed;
  const FoodOptions({
    Key key,
    this.text,
    this.color,
    this.onpressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: backgroundColor,
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        height: 45,
        width: 100,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
