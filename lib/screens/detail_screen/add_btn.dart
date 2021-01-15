import 'package:flutter/material.dart';

class AddBtn extends StatelessWidget {
  final String text;
  final Function onpressed;
  const AddBtn({
    Key key,
    this.text,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 10,
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 0,
        splashColor: Colors.white,
        shape: StadiumBorder(),
        color: Color(0xFFFFC46B),
        onPressed: onpressed,
        child: Text(text,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
