import 'package:flutter/material.dart';
import 'package:list_api/data/models/weather.dart';

class CityWidget extends StatelessWidget {
  final Forecast? forecast;
  const CityWidget({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${forecast?.city?.name},',
          textAlign: TextAlign.right,
          style: theme.textTheme.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(forecast?.city?.country ?? ''),
        // Text(forecast?.list?[0].main?.temp?.toInt().toString() ?? ''),
      ],
    );
  }
}
