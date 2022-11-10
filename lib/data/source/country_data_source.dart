import 'dart:convert';

import 'package:countries/data/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryDataSource {
  final _url = Uri.parse("https://restcountries.com/v3.1/all");

  Future<List<Country>> getCountry() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      Iterable body = jsonDecode(response.body);
      return List.from(body.map((e) => Country.fromJson(e)));
    } else {
      throw Exception('Could not get data');
    }
  }
}
