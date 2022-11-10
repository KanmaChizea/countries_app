import 'package:countries/data/model/country_model.dart';
import 'package:countries/data/source/country_data_source.dart';

class CountryRepository {
  CountryRepository(CountryDataSource dataSource) : _dataSource = dataSource;
  final CountryDataSource _dataSource;

  Future<List<Country>> getCountry() async {
    try {
      return await _dataSource.getCountry();
    } catch (e) {
      rethrow;
    }
  }
}
