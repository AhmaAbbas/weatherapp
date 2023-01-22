import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubit/states.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'Screens/Search_Screen.dart';
import 'Screens/home_pagedesign.dart';
import 'providers/weather_providers.dart';


class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return Search();
            }));
          }, icon: Icon(Icons.search))
        ],
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),)  ,
                                                    //_weather_model
      body:BlocBuilder<Weather_Cubit,WeatherStates>(
        builder: (context,state){
          if(state is WeatherLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is WeatherSucces){
            try{
              return Home_design(weather_model: state.weather_model,);
            }catch(error){
              return Text("error: $error}");
            }
          }
          else if(state is WeatherFailure){
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Some thing went wrong please try again ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }
          else
            {
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "There is no weather start searching now",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
        },
      ) ,
    );
  }
}
// weatherdata !=null?Home_design(weather_model: weatherdata ,):Container(
// width: double.infinity,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisSize: MainAxisSize.max,
// children: [
// Text(
// "There is no weather start searching now",
// style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// )
// ],
// ),
// )