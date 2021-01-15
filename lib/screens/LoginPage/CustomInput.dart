import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final Function onsubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool obscuretext;
  const CustomInput({
    Key key,
    this.hinttext,
    this.focusNode,
    this.textInputAction,
    this.obscuretext,
    this.controller,
    this.onsubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]),
      child: TextField(
        textInputAction: textInputAction,
        controller: controller,
        onSubmitted: onsubmitted,
        obscureText: obscuretext,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: hinttext,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
