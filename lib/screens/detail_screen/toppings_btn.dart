import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToppingBtn extends StatefulWidget {
  final String text;
  int toppingsValue;
  Function addToppings;
  Function removeToppings;
  ToppingBtn({
    Key key,
    @required this.toppingsValue,
    this.text,
    this.addToppings,
    this.removeToppings,
  }) : super(key: key);

  @override
  _ToppingBtnState createState() => _ToppingBtnState();
}

class _ToppingBtnState extends State<ToppingBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.topLeft,
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
                  icon: Icon(EvaIcons.minus),
                  onPressed: widget.removeToppings,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '${widget.toppingsValue}',
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
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
                  icon: Icon(EvaIcons.plus),
                  onPressed: widget.addToppings,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
