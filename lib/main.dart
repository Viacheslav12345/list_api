import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/data/services/database_service.dart';
import 'package:list_api/data/services/weather_service.dart';
import 'package:list_api/firebase_options.dart';
import 'package:list_api/presentation/countries_page/country_cubit/cubit/countries_cubit.dart';
import 'package:list_api/presentation/home_page.dart';
import 'package:list_api/presentation/weather_page/weather_cubit/weather_cubit.dart';
import 'package:list_api/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getSavedLocale();
    super.initState();
  }

  Locale locale = const Locale('uk', 'UK');

  void getSavedLocale() async {
    locale = Locale(widget.prefs.getString('localeLang') ?? 'uk',
        widget.prefs.getString('localeCountry') ?? 'UK');
  }

  void setLocale(Locale value) async {
    await widget.prefs.setString('localeLang', value.languageCode);
    await widget.prefs.setString('localeCountry', value.countryCode ?? '');

    setState(() {
      locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CountriesCubit(databaseService: DatabaseService())
                ..onLoadAllCountries(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(WeatherService()),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: const HomePage(),
      ),
    );
  }
}
