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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon!),
          Text(forecast.list?[0].main?.temp?.toStringAsFixed(0) ?? '')
        ],
      ),
    );
  }
}
