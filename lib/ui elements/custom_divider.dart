import 'package:flutter/material.dart';


class CustomDivider extends StatelessWidget {
  double top;
  double left;
  CustomDivider({Key? key,required this.left, required this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return Positioned(top:top,left:left,child:Container(
      height: dimension.height*0.1,
      width: dimension.width*0.01,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),
    ));
  }
}
