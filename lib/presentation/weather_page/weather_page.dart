import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/main.dart';
import 'package:list_api/presentation/weather_page/weather_cubit/weather_cubit.dart';
import 'package:list_api/presentation/weather_page/weather_widgets.dart/city_widget.dart';
import 'package:list_api/presentation/weather_page/weather_widgets.dart/days_forecast_widget.dart';
import 'package:list_api/presentation/weather_page/weather_widgets.dart/details_widget.dart';
import 'package:list_api/presentation/weather_page/weather_widgets.dart/temp_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  Future<void> _pullRefresh() async {
    await BlocProvider.of<WeatherCubit>(context).onLoadCityForecast(
        widget.cityNameList, MyApp.of(context)!.locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 25,
            fontFamily: 'Pacifico'),
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Theme.of(context).cardColor),
          iconSize: 35,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.weatherTitle} ${widget.country}',
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).scaffoldBackgroundColor,
        onRefresh: () => _pullRefresh(),
        child:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
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
                    return Card(
                        elevation: 3,
                        color: Theme.of(context).cardColor,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            CityWidget(forecast: state.citiesForecasts[index]),
                            TempWidget(forecast: state.citiesForecasts[index]),
                            DetailsWidget(
                                forecast: state.citiesForecasts[index]),
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 103,
                              width: MediaQuery.of(context).size.width - 40,
                              child: DaysForecastWidget(
                                  forecast: state.citiesForecasts[index]),
                            )
                          ],
                        ));
                  },
                ),
              ),
            WeatherLoadingFailure() => const Text('Error'),
          };
        }),
      ),
    );
  }
}
