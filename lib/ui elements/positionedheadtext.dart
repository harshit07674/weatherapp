import 'package:flutter/material.dart';
import 'package:weather/utils/textstyle.dart';

class PositionedHeadText extends StatefulWidget {
  String heading;
  FontWeight weight;
  double top;
  double left;
  PositionedHeadText({Key? key,required this.heading,required this.weight,required this.top,required this.left}) : super(key: key);

  @override
  State<PositionedHeadText> createState() => _PositionedTextState();
}

class _PositionedTextState extends State<PositionedHeadText> {
  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return Positioned(top: widget.top,left:widget.left,child: Container(height:dimension.height*0.15,width:dimension.width*0.6,child: Text("${widget.heading}",style: textScheme(widget.weight),)),);

  }
}
