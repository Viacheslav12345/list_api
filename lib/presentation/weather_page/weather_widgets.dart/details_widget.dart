import 'package:flutter/material.dart';
import 'package:list_api/data/models/weather.dart';

class DetailsWidget extends StatelessWidget {
  final Forecast? forecast;

  const DetailsWidget({Key? key, this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pressure = (forecast?.list?[0].main?.pressure ?? 0) * 0.750062;
    var humidity = forecast?.list?[0].main?.humidity?.round() ?? '';
    var wind = forecast?.list?[0].wind?.speed?.round() ?? '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Icon(
                Icons.thermostat,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Row(
                children: [
                  Text(
                    pressure.round().toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    'mm',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Icon(
                Icons.water_drop,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Row(
                children: [
                  Text(
                    humidity.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Icon(
                Icons.wind_power,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Row(
                children: [
                  Text(
                    wind.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    'm/s',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
