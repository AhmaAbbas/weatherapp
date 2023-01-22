import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class Weather_Service{
  Future<Weather_Model?> get_Weather({ required String city}) async {
    Weather_Model? weather_model;
    try{
      String baseurl='https://api.weatherapi.com/v1';
      String apikey="a97896007859435d9b6132553222712";
      Uri url=Uri.parse('$baseurl/forecast.json?key=$apikey&q=$city&days=4');
      http.Response response=await http.get(url);
      Map<String,dynamic>data=jsonDecode(response.body);
      // print(data);

       weather_model=Weather_Model.fromjson(data);
    }catch(error){
      print("error $error");
    }
    return weather_model;
  }
}
//http://api.weatherapi.com/v1/current.json?key=a97896007859435d9b6132553222712&q=London&aqi=no
//https://api.weatherapi.com/v1/forecast.json?key=a97896007859435d9b6132553222712&q=Alexandria&days=4&aqi=no&alerts=no