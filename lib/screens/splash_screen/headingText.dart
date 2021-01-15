import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Piz',
        style: TextStyle(
            fontSize: 56, fontWeight: FontWeight.bold, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: 'z',
            style: TextStyle(
                fontSize: 56, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          TextSpan(
            text: 'ato',
            style: TextStyle(
                fontSize: 56, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
