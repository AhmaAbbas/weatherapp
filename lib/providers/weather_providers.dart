
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weather_provider extends ChangeNotifier{
  Weather_Model? _weather_model;
  String? _cityname;
  void set_cityname(String? cityname){
    _cityname=cityname;
    notifyListeners();
  }
  String get_cityname(){
    return _cityname!;
  }
  void set_weather_data(Weather_Model weather){
    _weather_model=weather;
    notifyListeners();
  }
  Weather_Model? get_weather_data(){
    return _weather_model;
}
}