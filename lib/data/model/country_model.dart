import 'dart:convert';
import 'package:intl/intl.dart';

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
    final formatter = NumberFormat('#,##,000');
    final languages =
        map['languages'] as Map<String, dynamic>? ?? {'': 'Unavailable'};
    final capitals = map['capital'] as List? ?? ['Unavailable'];
    final continents = map['continents'] as List? ?? ['Unavailable'];
    final time = map['timezones'] as List? ?? ['Unavailable'];
    final currencies = map['currencies'] as Map<String, dynamic>? ??
        {
          '': {'name': 'Unavailable'}
        };
    final week = map['startOfWeek'] as String? ?? 'Unavailabe';
    final side = map['car']['side'] as String? ?? 'Unavailable';
    return Country(
      name: map['name']['common'] ?? 'Unavailable',
      capital: capitals.first,
      region: map['region'] ?? 'Unavailable',
      population: formatter.format(map['population']).toString(),
      language: languages.values.first,
      continent: continents.first,
      subRegion: map['subregion'] ?? 'Unavailable',
      independence: map['independent'] ?? false,
      area: formatter.format(map['area']).toString(),
      currency: currencies.values.first['name'] ?? 'Unavailable',
      timeZone: time.first,
      startOfWeek: week.replaceRange(0, 1, week[0].toUpperCase()),
      drivingSide: side.replaceRange(
              0, 1, side[0].toUpperCase()),
      flagURL: map['flags']['png'] ?? '',
      coatOfArms: map['coatOfArms']['png'] ?? '',
    );
  }

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  List<Object?> get props => throw UnimplementedError();
}
