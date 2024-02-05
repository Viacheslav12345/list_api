import 'package:flutter/material.dart';
import 'package:list_api/main.dart';

import 'package:list_api/presentation/countries_page/countries_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.applicationTitle,
          ),
          titleTextStyle: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 32,
              fontFamily: 'Pacifico'),
          actions: [
            DropdownButton(
                isDense: true,
                underline: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                value: MyApp.of(context)!.locale.languageCode == 'en'
                    ? 'en'
                    : 'uk',
                style: Theme.of(context).primaryTextTheme.bodySmall,
                items: const [
                  DropdownMenuItem(
                    alignment: Alignment.center,
                    value: 'en',
                    child: Text('Eng'),
                  ),
                  DropdownMenuItem(
                    alignment: Alignment.center,
                    value: 'uk',
                    child: Text('Укр'),
                  ),
                ],
                onChanged: (value) {
                  (value == 'en')
                      ? MyApp.of(context)!.setLocale(
                          const Locale.fromSubtags(languageCode: 'en'))
                      : MyApp.of(context)!.setLocale(
                          const Locale.fromSubtags(languageCode: 'uk'));
                  setState(() {});
                })
          ]),
      body: const CountriesPage(),
    );
  }
}
