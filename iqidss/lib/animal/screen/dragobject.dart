import 'package:flutter/material.dart';

class DragObject extends StatefulWidget {
  final String image;
  final double height;
  final bool score;
  final String data;
  DragObject({this.image, this.height, this.score, this.data});

  @override
  _DragObjectState createState() => _DragObjectState();
}

class _DragObjectState extends State<DragObject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //height: widget.height,
      padding: EdgeInsets.all(10),
      child: Draggable(
        // child: Image.asset(widget.image,height:widget.height),
        // feedback: Image.asset(widget.image,height:widget.height),
        // childWhenDragging: Container(),
        // data: widget.name,
        child: widget.score == true
            ? Container()
            : Image.asset(widget.image, height: widget.height),
        feedback: Image.asset(widget.image, height: widget.height),
        childWhenDragging: Container(),
        data: widget.data,
      ),
    );
  }
}
