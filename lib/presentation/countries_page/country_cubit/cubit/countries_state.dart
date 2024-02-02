part of 'countries_cubit.dart';

sealed class CountriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CountriesInitial extends CountriesState {}

final class CountriesLoading extends CountriesState {}

final class CountriesLoaded extends CountriesState {
  final List<Country> allCountries;

  CountriesLoaded(this.allCountries);
  @override
  List<Object?> get props => [allCountries];
}

final class CountriesLoadingFailure extends CountriesState {
  final Object? exception;

  CountriesLoadingFailure({required this.exception});
  @override
  List<Object?> get props => [exception];
}
