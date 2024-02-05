import 'dart:developer';

import 'package:list_api/const.dart';
import 'package:list_api/data/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  Future<Forecast> getWeather(String city, String language) async {
    var queryParameters = {
      'appid': Constants.appId,
      'units': 'metric',
      'q': city,
      'lang': (language == 'en') ? 'En' : 'Ua'
    };

    var uri =
        Uri.https(Constants.domain, Constants.weatherPath, queryParameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return Forecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
