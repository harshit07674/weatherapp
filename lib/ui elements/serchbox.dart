import 'package:flutter/material.dart';
import 'package:weather/utils/textstyle.dart';
import 'package:weather/screens/homescreen.dart';



class SearchBox extends StatefulWidget {
  bool shouldExpand;
  double top;
  double left;
  String city;
  SearchBox({Key? key,required this.shouldExpand,required this.left,required this.top,required this.city}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController searchedCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
      curve: Curves.decelerate,
      height: widget.shouldExpand? dimension.height*0.08:0,
       width: widget.shouldExpand? dimension.width*0.93:0,
       child: TextField(
         controller: searchedCity,
         keyboardType: TextInputType.text,
         style: textScheme(FontWeight.w500),
         cursorColor: Colors.white54,
         cursorHeight: dimension.height*0.055,
         decoration: InputDecoration(
           hintText: "enter city & press search icon",
           fillColor: Colors.white24,
           filled: true,
           hintStyle: TextStyle(fontSize: 20,color: Colors.white,),
           contentPadding: EdgeInsets.only(top: 10,left: 25),
           border: OutlineInputBorder(
             borderSide: BorderSide(color: Colors.black),
             borderRadius: BorderRadius.circular(30),
           ),
           focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(30),
             borderSide: BorderSide(color: Colors.blue),
           )
         ),
         onChanged: (searchedCity){
           setState(() {
             widget.city = searchedCity;
             cityname =  searchedCity.toString();
           });
         },

       ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
