// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:list_api/data/models/weather.dart';

class DaysForecastWidget extends StatelessWidget {
  final Forecast forecast;
  const DaysForecastWidget({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listDaysIndex = [7, 15, 23, 31, 39];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listDaysIndex.length,
      itemBuilder: (context, index) {
        var formatDate = DateTime.fromMillisecondsSinceEpoch(
            forecast.list![listDaysIndex[index]].dt! * 1000);
        String date = DateFormat('EEE,dd').format(formatDate);
        var icon = forecast.list?[listDaysIndex[index]].getIconUrl();
        var temp = forecast.list?[listDaysIndex[index]].main?.temp
                ?.toStringAsFixed(0) ??
            '';

        return Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(3),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Text(date, style: Theme.of(context).textTheme.labelSmall),
              Image.network(
                icon!,
              ),
              Text(
                '$temp °C',
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
