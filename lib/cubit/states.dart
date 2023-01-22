import 'package:weatherapp/models/weather_model.dart';

abstract class WeatherStates{}
class WeatherInitial extends WeatherStates{}

class WeatherLoading extends WeatherStates{}
class WeatherSucces extends WeatherStates{
  Weather_Model weather_model;
  WeatherSucces({required this.weather_model});
}
class WeatherFailure extends WeatherStates{}
class Citynamestaes extends WeatherStates{}