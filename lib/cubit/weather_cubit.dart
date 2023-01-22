import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Services/Weather_Services.dart';
import 'package:weatherapp/cubit/states.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weather_Cubit extends Cubit<WeatherStates>{
  Weather_Cubit({required this.weather_service}) : super(WeatherInitial());
  Weather_Service weather_service;
  Weather_Model? weather_model;
  String? cityname;
  void get_weather({required String cityname})async{
    emit(WeatherLoading());
   try {
     //city=cityname;
     weather_model=await weather_service.get_Weather(city: cityname);
     emit(WeatherSucces(weather_model: weather_model!));
   }on Exception catch(error){
     emit(WeatherFailure());
   }
  }
  void set_cityname({required String city}){
    cityname=city;
    emit(Citynamestaes());
  }
  String get_cityname(){
   return cityname!;
  }
}