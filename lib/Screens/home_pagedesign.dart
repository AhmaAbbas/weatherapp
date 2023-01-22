import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';

import '../cubit/states.dart';
import '../cubit/weather_cubit.dart';
import '../providers/weather_providers.dart';

class Home_design extends StatelessWidget {
   Home_design({required this.weather_model});
   Weather_Model? weather_model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:weather_model == null ? Colors.black : weather_model!.get_color(),
          gradient: LinearGradient(
              colors: [
                weather_model!.get_color()!,
                weather_model!.get_color()![300]!,
                weather_model!.get_color()![100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      width: double.infinity,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
          Text(BlocProvider.of<Weather_Cubit>(context)!.cityname!.toString()??" ",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 35),),
          Text("updated at: ${weather_model!.date} ",style: TextStyle(fontSize: 20),),
          Spacer(flex: 1,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weather_model!.get_image()!),
              Text("30",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
              Column(
                children: const[
                  Text("maxtemp: 18.8",style: TextStyle(fontSize: 15),),
                  Text("mintemp: 14.2",style: TextStyle(fontSize: 15),),
                ],
              ),
            ],),
          Spacer(flex: 1,),
          Text(weather_model?.weatherstatename??'',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 35),),
          Spacer(flex: 5,),
        ],
      ),
    );
  }
}
