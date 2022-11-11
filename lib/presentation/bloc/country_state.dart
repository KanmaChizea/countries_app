part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  const CountryLoaded(this.countries);

  @override
  List<Object> get props => [countries.length];
}

class CountryFailed extends CountryState {
  final String errorMessage;

  const CountryFailed(this.errorMessage);
}
