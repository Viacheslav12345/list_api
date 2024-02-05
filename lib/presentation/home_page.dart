import 'package:flutter/material.dart';
import 'package:list_api/presentation/countries_page/countries_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Weather for Travel',
          ),
          titleTextStyle: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 32,
              fontFamily: 'Pacifico')),
      body: const CountriesPage(),
    );
  }
}
