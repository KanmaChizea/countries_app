import 'dart:convert';

import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String capital;
  final String region;
  final String population;
  final String language;
  final String continent;
  final String subRegion;
  final bool independence;
  final String area;
  final String currency;
  final String timeZone;
  final String startOfWeek;
  final String flagURL;
  final String drivingSide;
  final String coatOfArms;
  const Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.language,
    required this.continent,
    required this.subRegion,
    required this.independence,
    required this.area,
    required this.currency,
    required this.timeZone,
    required this.startOfWeek,
    required this.flagURL,
    required this.drivingSide,
    required this.coatOfArms,
  });

  factory Country.fromMap(Map map) {
    final languages =
        map['languages'] as Map<String, dynamic>? ?? {'': 'Unavailable'};
    final capitals = map['capital'] as List? ?? ['Unavailable'];
    final continents = map['continents'] as List? ?? ['Unavailable'];
    final time = map['timezones'] as List? ?? ['Unavailable'];
    final currencies = map['currencies'] as Map<String, dynamic>? ??
        {
          '': {'name': 'Unavailable'}
        };
    return Country(
      name: map['name']['common'] ?? 'Unavailable',
      capital: capitals.first,
      region: map['region'] ?? 'Unavailable',
      population: map['population'].toString(),
      language: languages.values.first,
      continent: continents.first,
      subRegion: map['subregion'] ?? 'Unavailable',
      independence: map['independent'] ?? false,
      area: map['area'].toString(),
      currency: currencies.values.first['name'] ?? 'Unavailable',
      timeZone: time.first,
      startOfWeek: map['startOfWeek'] ?? 'Unavailable',
      drivingSide: map['car']['side'] ?? 'Unavailable',
      flagURL: map['flags']['png'] ?? '',
      coatOfArms: map['coatOfArms']['png'] ?? '',
    );
  }

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  List<Object?> get props => throw UnimplementedError();
}
