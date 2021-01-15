import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  final Icon icon;
  final Icon icon2;
  const LocationButton({
    Key key,
    this.text,
    this.onpressed,
    this.icon,
    this.icon2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: FlatButton(
        splashColor: Color(0xFFFFC46B),
        onPressed: onpressed,
        child: ListTile(
          leading: icon,
          title: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          trailing: icon2,
        ),
      ),
    );
  }
}
