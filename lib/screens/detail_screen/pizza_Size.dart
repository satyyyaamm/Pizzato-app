import 'package:flutter/material.dart';

class PizzaSize extends StatefulWidget {
  const PizzaSize({
    Key key,
    @required this.pizzaSize,
  }) : super(key: key);

  final List pizzaSize;

  @override
  _PizzaSizeState createState() => _PizzaSizeState();
}

class _PizzaSizeState extends State<PizzaSize> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 450),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < widget.pizzaSize.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  _selected = i;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: _selected == i
                        ? Color(0xFFFFC46B)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: _selected == i
                            ? Colors.amber.shade100
                            : Colors.grey.shade200,
                        blurRadius: 10,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.pizzaSize[i]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _selected == i ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
