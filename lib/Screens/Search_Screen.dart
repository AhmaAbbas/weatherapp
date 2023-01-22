
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Home_page.dart';
import 'package:weatherapp/cubit/states.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';

import '../Services/Weather_Services.dart';
import '../providers/weather_providers.dart';

class Search extends StatelessWidget {
  Search();
  String? cityname;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Weather_Cubit,WeatherStates>(
      builder: (context,states){
        return Scaffold(
          appBar: AppBar(
            title: Text("Search Page ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                      onChanged: (value) async{
                        cityname=value;
                        // print('$cityname $weather');
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                          suffixIcon: GestureDetector(
                              onTap: ()async{
                                //cityname=city!;
                                try{
                                  Weather_Service service= Weather_Service();
                                  BlocProvider.of<Weather_Cubit>(context).set_cityname(city: cityname!);
                                  BlocProvider.of<Weather_Cubit>(context).get_weather(cityname: cityname!);
                                  print(BlocProvider.of<Weather_Cubit>(context).weather_model!.get_color());
                                  print(BlocProvider.of<Weather_Cubit>(context).weather_model!.weatherstatename);

                                }catch(error){
                                  Text("error ${error}");
                                }
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.search)),
                          labelText: "search city",
                          border: OutlineInputBorder(
                            borderSide:const BorderSide(width: 3, color: Colors.greenAccent),
                            borderRadius:BorderRadius.circular(20.0),
                          )
                      )
                  ),
                ),
              ],
            ),
          ),
        );
      },
        listener: (context,states){},
        );
  }
}
