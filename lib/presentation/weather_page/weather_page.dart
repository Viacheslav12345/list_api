import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/presentation/weather_page/weather_cubit/weather_cubit.dart';
import 'package:list_api/presentation/weather_page/weather_widgets.dart/city_widget.dart';
import 'package:list_api/presentation/weather_page/weather_widgets.dart/temp_widget.dart';

class WeatherPage extends StatefulWidget {
  final String country;
  final List<String> cityNameList;
  const WeatherPage(
      {Key? key, required this.country, required this.cityNameList})
      : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // @override
  // void initState() {
  //   BlocProvider.of<WeatherCubit>(context)
  //       .onLoadCityForecast(widget.cityNameList);
  //   super.initState();
  // }

  // List<Future<Forecast>> listForecastOfCity = [];

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized().;
    // List<Forecast> citiesForecasts = [];
    // var weatherState = BlocProvider.of<WeatherCubit>(context).state;
    // if (weatherState is WeatherLoaded) {
    // citiesForecasts = weatherState.citiesForecasts;
    // }
    // var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Theme.of(context).cardColor),
          iconSize: 35,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Прогноз погоди в \n ${widget.country}'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        return switch (state) {
          WeatherInitial() || WeatherLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          WeatherLoaded() => Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.citiesForecasts.length,
                itemBuilder: (BuildContext context, int index) {
                  // if (weatherState is WeatherLoaded) {
                  // var citiesForecasts = weatherState.citiesForecasts;
                  return Card(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      CityWidget(forecast: state.citiesForecasts[index]),
                      TempWidget(forecast: state.citiesForecasts[index])
                    ],
                  ));
                  // } else {
                  // return CircularProgressIndicator();
                  // }
                  // return Card(
                  //     child: Column(
                  //   children: [
                  //     CityWidget(forecast: citiesForecasts[index]),
                  //     TempWidget(forecast: citiesForecasts[index])
                  //   ],
                  // ));
                },
              ),
            ),
          WeatherLoadingFailure() => const Text('Error'),
        };
      }),
    );
  }
}
