import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Services/Weather_Services.dart';
import 'package:weatherapp/cubit/states.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_providers.dart';

import 'Home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context){
      return Weather_Cubit(weather_service: Weather_Service());
    },
      child: Weathrer_App()));
}

class Weathrer_App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Weather_Cubit,WeatherStates>(
        builder: (context,states){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(

                primary: BlocProvider.of<Weather_Cubit>(context).weather_model == null ? Colors.black :BlocProvider.of<Weather_Cubit>(context).weather_model!.get_color(),

                // or from RGB



              ),
            ),
            home: Home_Page(),
          );
        });
  }
}

//
