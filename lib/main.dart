import 'presentation/style/theme_cubit.dart';
import 'presentation/style/themes.dart';
import 'data/repository/country_repository.dart';
import 'data/source/country_data_source.dart';
import 'presentation/bloc/filter_values_cubit.dart';
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
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => FilterValues()),
      ],
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            final focus = Focus.of(context);
            if (focus.hasPrimaryFocus) {
              focus.unfocus();
            }
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            themeMode: context.watch<ThemeCubit>().state,
            home: const HomeScreen(),
          ),
        );
      }),
    );
  }
}
