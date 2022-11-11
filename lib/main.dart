import 'package:countries/core/theme_cubit.dart';
import 'package:countries/core/themes.dart';
import 'package:countries/data/repository/country_repository.dart';
import 'package:countries/data/source/country_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/country_bloc.dart';
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
              ..add(GetCountries())),
        BlocProvider(create: (_) => ThemeCubit())
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          themeMode: context.watch<ThemeCubit>().state,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
