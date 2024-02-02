import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_api/data/services/database_service.dart';
import 'package:list_api/firebase_options.dart';
import 'package:list_api/presentation/countries_page/country_cubit/cubit/countries_cubit.dart';
import 'package:list_api/presentation/home_page.dart';
import 'package:list_api/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit(databaseService: DatabaseService()),
      child: MaterialApp(
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
