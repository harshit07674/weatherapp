import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';
import 'weatheranimatedbackground.dart';


class MistWeather extends StatefulWidget {
  const MistWeather({Key? key}) : super(key: key);

  @override
  State<MistWeather> createState() => _MistWeatherState();
}

class _MistWeatherState extends State<MistWeather> {
  @override
  Widget build(BuildContext context) {
    return WrapperScene(
      sizeCanvas: Size(280, 540),
      isLeftCornerGradient: true,
      colors: [
        Color(0xff607d8b),
        Color(0x4e9e9e9e),
      ],
      children: [
        WindWidget(windConfig: WindConfig(width: 6, y: 300, windGap: 15, blurSigma: 8, color: Color(0xffcfd8dc), slideXStart: 0, slideXEnd: 500, pauseStartMill: 50, pauseEndMill: 6000, slideDurMill: 1000, blurStyle: BlurStyle.solid),),
        WindWidget(windConfig: WindConfig(width: 6, y: 300, windGap: 11, blurSigma: 8, color: Color(0xff78909c), slideXStart: 0, slideXEnd: 500, pauseStartMill: 38, pauseEndMill: 6501, slideDurMill: 912, blurStyle: BlurStyle.solid),),
        SnowWidget(snowConfig: SnowConfig(count: 31, size: 7, color: Color(0x83ffffff), icon: IconData(62742, fontFamily: 'MaterialIcons'), widgetSnowflake: null, areaXStart: 101, areaXEnd: 229, areaYStart: 200, areaYEnd: 586, waveRangeMin: 20, waveRangeMax: 110, waveMinSec: 5, waveMaxSec: 15, waveCurve: Cubic(0.45, 0.05, 0.55, 0.95), fadeCurve: Cubic(0.60, 0.04, 0.98, 0.34), fallMinSec: 10, fallMaxSec: 67),),
        SnowWidget(snowConfig: SnowConfig(count: 27, size: 7, color: Color(0xc1ffcdd2), icon: IconData(62742, fontFamily: 'MaterialIcons'), widgetSnowflake: null, areaXStart: 72, areaXEnd: 175, areaYStart: 200, areaYEnd: 540, waveRangeMin: 20, waveRangeMax: 110, waveMinSec: 5, waveMaxSec: 20, waveCurve: Cubic(0.45, 0.05, 0.55, 0.95), fadeCurve: Cubic(0.60, 0.04, 0.98, 0.34), fallMinSec: 10, fallMaxSec: 60),),
        SunWidget(sunConfig: SunConfig(width: 139, blurSigma: 9, blurStyle: BlurStyle.solid, isLeftLocation: true, coreColor: Color(0x50ff9800), midColor: Color(0xffffee58), outColor: Color(0x9b673ab7), animMidMill: 1424, animOutMill: 1528),),
      ],
    );

  }
}
