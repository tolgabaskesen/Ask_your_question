import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  final String isim;
  final IconData icon;
  final int counter;
  ButtonAnimation(this.isim, this.icon, this.counter);
  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Align(
                    child: Text(
                      widget.isim,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(widget.icon, color: Colors.white),
                ),
              ],
            ),
          ),
          onTap: () {
            if (widget.counter == 0) {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Deneme');
            } else if (widget.counter == 1) {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Sorular');
            } else if (widget.counter == 2){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Internet');
            } ;
          },
        ),
      ],
    );
  }
}
