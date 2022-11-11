import '../model/country_model.dart';
import '../source/country_data_source.dart';

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
