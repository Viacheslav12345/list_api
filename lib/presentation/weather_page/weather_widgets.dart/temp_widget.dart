import 'package:flutter/material.dart';

import 'package:list_api/data/models/weather.dart';

class TempWidget extends StatelessWidget {
  final Forecast forecast;
  const TempWidget({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icon = forecast.list?[0].getIconUrl();
    var temp = forecast.list?[0].main?.temp?.toStringAsFixed(0) ?? '';
    var description = forecast.list?[0].weather?[0].description ?? '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: MediaQuery.of(context).size.width / 3 - 30,
          child: Text(
            '$temp °C',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 3 - 50,
          child: Image.network(
            icon!,
            scale: 0.7,
            filterQuality: FilterQuality.high,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width / 3 - 30,
          child: Text(description),
        ),
      ],
    );
  }
}
