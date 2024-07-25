import 'package:flutter/material.dart';




class PositionedIcon extends StatefulWidget {
  IconData icon;
  double top;
  double left;
  final VoidCallback? action;
  PositionedIcon({Key? key,required this.left,required this.top, required this.icon,this.action}) : super(key: key);

  @override
  State<PositionedIcon> createState() => _PositionedIconState();
}

class _PositionedIconState extends State<PositionedIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(top: widget.top,left: widget.left,child: GestureDetector(onTap:widget.action,child: Icon(widget.icon,color: Colors.white,size: 40,)),);
  }
}
