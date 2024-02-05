import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:list_api/data/models/weather.dart';
import 'package:list_api/data/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  WeatherCubit(
    this.weatherService,
  ) : super(WeatherInitial());

  Future<void> onLoadCityForecast(
      List<String> citiesList, String language) async {
    List<Forecast> listForecast = [];
    // emit(WeatherLoading());
    for (var i = 0; i < citiesList.length; i++) {
      try {
        var cityForecast =
            await weatherService.getWeather(citiesList[i], language);
        listForecast.add(cityForecast);
      } catch (e) {
        emit(WeatherLoadingFailure(exception: e));
      }
    }
    emit(WeatherLoaded(listForecast));
  }
}
