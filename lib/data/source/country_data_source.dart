import 'dart:convert';

import '../model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryDataSource {
  final _url = Uri.parse("https://restcountries.com/v3.1/all");

  Future<List<Country>> getCountry() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      List<Country> list = [];
      final body = json.decode(response.body) as Iterable;
      for (Map i in body) {
        list.add(Country.fromMap(i));
      }
      return list;
    } else {
      throw Exception('Could not get data');
    }
  }
}
