import 'package:flutter/material.dart';
import 'package:weather/Models/weather.dart';
import 'package:weather/backend/weathermap.dart';
import 'package:weather/ui%20elements/PositionedIcon.dart';
import 'package:weather/ui%20elements/custom_divider.dart';
import 'package:weather/ui%20elements/mist.dart';
import 'package:weather/ui%20elements/positionedheadtext.dart';
import 'package:weather/ui%20elements/serchbox.dart';
import 'package:weather/ui%20elements/weatheranimatedbackground.dart';
import 'package:weather/utils/textstyle.dart';
import 'package:weather_animation/weather_animation.dart';
import 'package:intl/intl.dart';

String cityname = '';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 WeatherScene scenery = WeatherScene.scorchingSun;
  bool isExpanded = false;

  String date='';
  Future<WeatherModel> getData() async {
    return await fetchWeather(cityname==''?'jaipur':cityname);
  }
  Future<WeatherModel>? weatherData;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      weatherData = getData();
      DateTime dateTime =  DateTime.now();
      date = DateFormat("dd-MM-yyyy").format(dateTime);

    });
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: weatherData!,
        builder: (context, snapshot) {
          if(snapshot.data==null){
            return Stack(
              children: [
                Container(height: double.infinity,width: double.infinity,child: WeatherBackground(scene: WeatherScene.scorchingSun,)),
                SearchBox(shouldExpand: true, left: dimension.width*0.05, top: dimension.height*0.1,city: cityname,),
                PositionedHeadText(heading: "no such city", weight: FontWeight.bold, top: dimension.height*0.4, left: dimension.width*0.2),
                PositionedIcon(left: dimension.width*0.85, top: dimension.height*0.105, icon: Icons.search,action: () async{
                  setState(() {
                    weatherData=getData();
                  });
                },),
              ],
            );
          }
          var data = snapshot.data as WeatherModel;
          if(data.main=='Mist'||data.main=='Haze'){

          }
          if(data.main=="Clear"){
            scenery=WeatherScene.scorchingSun;
          }
          if(data.main=='Clouds'||data.main=='Rain'){
            scenery=WeatherScene.rainyOvercast;
          }
          if(data.main=='Thunderstorm'){
            scenery=WeatherScene.stormy;
          }
          if(data.main=='Snow'){
            scenery=WeatherScene.snowfall;
          }
          return Stack(
            children: [
              Container(
                  height:double.infinity,
                  width:double.infinity,
                  child: data.main=='Mist'||data.main=='Haze'?MistWeather():WeatherBackground(scene:scenery,)
              ),
              PositionedHeadText(heading: "${cityname}"==''?'Jaipur':'${cityname}',weight: FontWeight.bold,top: dimension.height*0.3,left: dimension.width*0.3,),
              PositionedHeadText(heading: "${date}",weight: FontWeight.bold,top: dimension.height*0.36,left: dimension.width*0.3,),
              PositionedHeadText(heading: "${data.temp}\u2103",weight: FontWeight.bold,top: dimension.height*0.42,left: dimension.width*0.3,),
              PositionedHeadText(heading: "${data.main}",weight: FontWeight.bold,top: dimension.height*0.47,left: dimension.width*0.3,),
              PositionedHeadText(heading: "Min Temp",weight: FontWeight.bold,top: dimension.height*0.60,left: dimension.width*0.1,),
              PositionedHeadText(heading: "${data.temp_min}\u2103",weight: FontWeight.normal,top: dimension.height*0.66,left: dimension.width*0.18,),
              CustomDivider(left: dimension.width*0.51, top: dimension.height*0.61),
              PositionedHeadText(heading: "Max Temp",weight: FontWeight.bold,top: dimension.height*0.60,left: dimension.width*0.6,),
              PositionedHeadText(heading: "${data.temp_max}\u2103",weight: FontWeight.normal,top: dimension.height*0.66,left: dimension.width*0.69,),
              PositionedHeadText(heading: "Humidity",weight: FontWeight.bold,top: dimension.height*0.73,left: dimension.width*0.1,),
              PositionedHeadText(heading: "${data.humidity}%",weight: FontWeight.normal,top: dimension.height*0.79,left: dimension.width*0.18,),
              CustomDivider(left: dimension.width*0.51, top: dimension.height*0.74),
              PositionedHeadText(heading: "Wind Speed",weight: FontWeight.bold,top: dimension.height*0.73,left: dimension.width*0.55,),
              PositionedHeadText(heading: "${data.speed}km/hr",weight: FontWeight.normal,top: dimension.height*0.79,left: dimension.width*0.6,),
              Positioned(top:dimension.height*0.9,child: Container(margin:EdgeInsets.only(left: 30),height: dimension.height*0.06,width: dimension.width*0.9,decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              padding: EdgeInsets.only(left: 10,right: 10),
              )),
              PositionedHeadText(top: dimension.height*0.905,left: dimension.width*0.1,heading: "Cloudiness:",weight: FontWeight.bold,),
              PositionedHeadText(top: dimension.height*0.905,left: dimension.width*0.56,heading: "${data.all}%",weight: FontWeight.normal,),
              PositionedIcon(left: dimension.width*0.8, top: dimension.height*0.905, icon: Icons.thunderstorm_sharp),
              SearchBox(shouldExpand: isExpanded, left: dimension.width*0.05,top:dimension.width*0.2,city: cityname,),
              PositionedIcon(left: dimension.width*0.85, top: dimension.height*0.105, icon: Icons.search,action: () async{
                setState(() {
                 isExpanded=!isExpanded;
                 weatherData=getData();
                });
              },),

            ],
          );
        }
      ),
    );
  }
}

