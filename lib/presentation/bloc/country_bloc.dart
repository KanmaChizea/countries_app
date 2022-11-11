import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/country_model.dart';
import '../../data/repository/country_repository.dart';

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
      emit(CountryFailed(e.toString()));
    }
  }

  FutureOr<void> _onFilterCountries(
      FilterCountries event, Emitter<CountryState> emit) {
    final List<Country> list = List.from(countryList);
    log(event.continents.toString());
    log(event.timeZones.toString());
    final List<Country> newList = list.where((element) {
      return event.continents.contains(element.continent) ||
          event.timeZones.any(element.timeZone.contains);
    }).toList();
    log(newList.toString());
    emit(CountryLoaded(newList));
  }

  FutureOr<void> _onSearchCountry(
      SearchCountry event, Emitter<CountryState> emit) {
    final List<Country> countries = [];
    for (var i in countryList) {
      if (i.name.toLowerCase().contains(event.value.toLowerCase())) {
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
