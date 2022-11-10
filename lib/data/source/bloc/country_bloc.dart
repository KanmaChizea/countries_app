import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries/data/model/country_model.dart';
import 'package:countries/data/repository/country_repository.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(CountryRepository repo)
      : _repo = repo,
        super(CountryInitial()) {
    on<GetCountries>(_onGetCountries);
    on<FilterCountries>(_onFilterCountries);
    on<SearchCountry>(_onSearchCountry);
    on<ResetCountries>(_onResetCountries);
  }

  final CountryRepository _repo;

  @visibleForTesting
  List<Country> countryList = [];

  FutureOr<void> _onGetCountries(
      GetCountries event, Emitter<CountryState> emit) async {
    emit(CountryLoading());
    try {
      final countries = await _repo.getCountry();
      countries.sort((a, b) => a.name.compareTo(b.name));
      countryList = countries;
      emit(CountryLoaded(countries));
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onFilterCountries(
      FilterCountries event, Emitter<CountryState> emit) {
    final List<Country> list = List.from(countryList);
    final List<Country> newList = list.where((element) {
      return event.continents.contains(element.continent) ||
          event.currency.any(element.currency.contains) ||
          event.language.any(element.language.contains) ||
          event.timeZones.any(element.timeZone.contains);
    }).toList();
    emit(CountryLoaded(newList));
  }

  FutureOr<void> _onSearchCountry(
      SearchCountry event, Emitter<CountryState> emit) {
    final List<Country> countries = [];
    for (var i in countryList) {
      if (i.name.contains(event.value)) {
        countries.add(i);
      }
    }
    emit(CountryLoaded(countries));
  }

  FutureOr<void> _onResetCountries(
      ResetCountries event, Emitter<CountryState> emit) {
    emit(CountryLoaded(countryList));
  }
}
