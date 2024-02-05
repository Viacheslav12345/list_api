import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_api/data/models/weather.dart';

class CityWidget extends StatelessWidget {
  final Forecast? forecast;
  const CityWidget({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String city = forecast?.city?.name ?? '';
    String country = forecast?.city?.country ?? '';
    var formatDate =
        DateTime.fromMillisecondsSinceEpoch(forecast!.list![0].dt! * 1000);
    String date = DateFormat('EEEE, MMM d').format(formatDate);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city,
              textAlign: TextAlign.right,
              style: theme.textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Text(date, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
