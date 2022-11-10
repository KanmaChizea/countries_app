import 'package:countries/core/themes.dart';
import 'package:countries/data/repository/country_repository.dart';
import 'package:countries/data/source/bloc/country_bloc.dart';
import 'package:countries/data/source/country_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CountryBloc(CountryRepository(CountryDataSource()))
              ..add(GetCountries()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light,
        darkTheme: ThemeData(),
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      ),
    );
  }
}
