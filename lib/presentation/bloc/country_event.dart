part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetCountries extends CountryEvent {}

class FilterCountries extends CountryEvent {
  final List<String> continents;
  final List<String> timeZones;
  final List<String> currency;
  final List<String> language;

  const FilterCountries(
    this.continents,
    this.timeZones,
    this.currency,
    this.language,
  );
}

class SearchCountry extends CountryEvent {
  final String value;

  const SearchCountry(this.value);
}

class ResetCountries extends CountryEvent {}
