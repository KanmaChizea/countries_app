import 'package:countries/data/model/country_model.dart';
import 'package:countries/data/repository/country_repository.dart';
import 'package:countries/data/source/bloc/country_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCountryRepository extends Mock implements CountryRepository {}

void main() {
  late CountryBloc sut;
  late MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    sut = CountryBloc(mockCountryRepository);
  });

  const List<Country> countryList = [
    Country(
        name: 'testname',
        capital: 'testcapital',
        region: 'testregion',
        population: 'testpopulation',
        language: 'testlanguage',
        continent: 'testcontinent',
        subRegion: 'testsubregion',
        independence: true,
        area: 'testarea',
        currency: 'testcurrency',
        timeZone: 'testtimeZone',
        startOfWeek: 'teststartOfWeek',
        flagURL: 'testflagURL',
        drivingSide: 'testdrivingSide',
        coatOfArms: 'testcoatOfArms'),
    Country(
        name: 'testname1',
        capital: 'testcapital1',
        region: 'testregion1',
        population: 'testpopulation1',
        language: 'testlanguage1',
        continent: 'testcontinent1',
        subRegion: 'testsubregion1',
        independence: true,
        area: 'testarea1',
        currency: 'testcurrency1',
        timeZone: 'testtimeZone1',
        startOfWeek: 'teststartOfWeek1',
        flagURL: 'testflagURL1',
        drivingSide: 'testdrivingSide1',
        coatOfArms: 'testcoatOfArms1')
  ];

  group('Get countries event', () {
    void arrangeGetCountriesRepoReturn() {
      when(() => mockCountryRepository.getCountry())
          .thenAnswer((_) async => countryList);
    }

    void arrangeGetCountriesRepoThrow() {
      when(() => mockCountryRepository.getCountry())
          .thenThrow((_) => Exception('error'));
    }

    test("uses country repository", () async {
      arrangeGetCountriesRepoReturn();
      sut.add(GetCountries());
      await Future.delayed(const Duration(seconds: 5));
      verify(() => mockCountryRepository.getCountry()).called(1);
    });

    test("emits loading and loaded state when repo returns value", () async {
      arrangeGetCountriesRepoReturn();
      expectLater(sut.stream,
          emitsInOrder([CountryLoading(), const CountryLoaded(countryList)]));
      sut.add(GetCountries());
    });

    test(
      "emits loading and failed state when repo throws exception",
      () async {
        arrangeGetCountriesRepoThrow();
        expectLater(sut.stream,
            emitsInOrder([CountryLoading(), const CountryFailed('error')]));
        sut.add(GetCountries());
      },
    );
  });
  group('Filter countries event', () {
    test(
      "returns list of countries when filter extists",
      () async {},
    );
  });
  group('Search countries event', () {});
  group('Resert countries event', () {});
}
