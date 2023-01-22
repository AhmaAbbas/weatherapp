import 'package:flutter/material.dart';

class Weather_Model{
   String date;
   String weatherstatename;
   double temp;
   double maxTemp;
   double minTemp;
  Weather_Model(
      { required this.date,
        required this.weatherstatename,
        required this.temp,
        required this.maxTemp,
        required this.minTemp});
  factory Weather_Model.fromjson(dynamic data){
    var jsondata=data["forecast"]["forecastday"][0]['day'];
    // date= data["location"]["localtime"];
    // temp=jsondata["avgtemp_c"];
    // maxTemp= jsondata["maxtemp_c"];
    // minTemp=jsondata["mintemp_c"];
    // weatherstatename= jsondata["condition"]["text"];
    return Weather_Model(date: data["forecast"]["forecastday"][0]["date"],
        weatherstatename: jsondata["condition"]["text"],
        temp: jsondata["avgtemp_c"], maxTemp: jsondata["maxtemp_c"],
        minTemp: jsondata["mintemp_c"]);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'tem = $temp mintemp= $minTemp maxtemp= $maxTemp weatherstatename=$weatherstatename data=$date ';
  }
  String? get_image(){
    if(weatherstatename=='clear'||weatherstatename=='Light Cloud')
      {
        return "assets/images/clear.png";
      }
    else if(weatherstatename=='Heavy Cloud'||weatherstatename=='Partly cloudy')
    {
      return "assets/images/cloudy.png";
    }
    else if(weatherstatename=='Light Rain'||weatherstatename=='Heavy Rain'||weatherstatename=='Patchy rain possible')
    {
      return "assets/images/rainy.png";
    }
    else if(weatherstatename=='Hail'||weatherstatename=='Snow'||weatherstatename=='Sleet')
    {
      return "assets/images/snow.png";
    }
    else if(weatherstatename=='Thunder'||weatherstatename=='Thunderstorm')
    {
      return "assets/images/thunderstorm.png";
    }
    else
      {
        return "assets/images/clear.png";
      }

  }
   MaterialColor? get_color(){
     if(weatherstatename=='clear'||weatherstatename=='Light Cloud')
     {
       return Colors.orange;
     }
     else if(weatherstatename=='Heavy Cloud'||weatherstatename=='Partly cloudy')
     {
       return Colors.blueGrey;
     }
     else if(weatherstatename=='Light Rain'||weatherstatename=='Heavy Rain'||weatherstatename=='Patchy rain possible')
     {
       return Colors.blue;
     }
     else if(weatherstatename=='Hail'||weatherstatename=='Snow'||weatherstatename=='Sleet')
     {
       return Colors.blue;
     }
     else if(weatherstatename=='Thunder'||weatherstatename=='Thunderstorm')
     {
       return Colors.red;
     }
     else
     {
       return Colors.orange;
     }

   }
}