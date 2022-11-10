import 'dart:convert';

import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String capital;
  final String region;
  final String population;
  final String motto;
  final List<String> language;
  final String continent;
  final String religion;
  final bool independence;
  final String area;
  final List<String> currency;
  final List<String> timeZone;
  final String startOfWeek;
  final String flagURL;
  final String drivingSide;
  final String flag;
  final String coatOfArms;
  const Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.motto,
    required this.language,
    required this.continent,
    required this.religion,
    required this.independence,
    required this.area,
    required this.currency,
    required this.timeZone,
    required this.startOfWeek,
    required this.flagURL,
    required this.drivingSide,
    required this.flag,
    required this.coatOfArms,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    final languages = map['languages'] as Map<String, String>;
    return Country(
      name: map['name']['common'] ?? '',
      capital: map['capital'] ?? '',
      region: map['region'] ?? '',
      population: map['population'] ?? '',
      motto: map['motto'] ?? '',
      language: languages.values.toList(),
      continent: map['continents'],
      religion: map['religion'] ?? '',
      independence: map['independence'] ?? '',
      area: map['area'] ?? '',
      currency: map['currencies']['name'] ?? '',
      flag: map['flag'],
      timeZone: map['timezones'] ?? '',
      startOfWeek: map['startofweek'] ?? '',
      drivingSide: map['car']['side'] ?? '',
      flagURL: map['flags']['png'] ?? '',
      coatOfArms: map['coatofarms']['png'] ?? '',
    );
  }

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  List<Object?> get props => throw UnimplementedError();
}
