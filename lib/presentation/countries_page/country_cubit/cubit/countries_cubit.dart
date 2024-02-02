// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:list_api/data/models/country.dart';
import 'package:list_api/data/services/database_service.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  DatabaseService databaseService;

  CountriesCubit({
    required this.databaseService,
  }) : super(CountriesInitial());

  void onLoadAllCountries() async {
    try {
      if (state is! CountriesLoaded) {
        emit(CountriesLoading());
      }
      final List<Country> allCountries =
          await databaseService.getAllCountries();
      emit(CountriesLoaded(allCountries));
    } catch (exception) {
      emit(CountriesLoadingFailure(exception: exception));
    }
  }

  Future<void> onAddCountry(Country country) async {
    // if (state is CountriesLoaded) {
    // emit(CountriesLoading());
    try {
      await databaseService.addCountry(country);

      // emit(CountriesLoaded(allCountries));
    } catch (exception) {
      emit(CountriesLoadingFailure(exception: exception));
    }
    // }
  }
}
