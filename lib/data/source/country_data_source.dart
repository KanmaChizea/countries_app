import 'dart:convert';
import 'dart:developer';

import 'package:countries/data/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryDataSource {
  final _url = Uri.parse("https://restcountries.com/v3.1/all");

  Future<List<Country>> getCountry() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      List<Country> list = [];
      final body = json.decode(response.body) as Iterable;
      log(body.length.toString());
      for (Map i in body) {
        list.add(Country.fromMap(i));
      }
      return list;
    } else {
      log(response.statusCode.toString());
      throw Exception('Could not get data');
    }
  }
}
