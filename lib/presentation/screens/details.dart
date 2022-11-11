import '../bloc/flag_cubit.dart';
import 'package:flutter/material.dart';

import '../../data/model/country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/details/details_info.dart';
import '../widgets/details/image_navigator.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlagCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(country.name,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Stack(children: [
                    Center(
                      child: BlocBuilder<FlagCubit, FlagImage>(
                          builder: (contex, state) {
                        if (state == FlagImage.flag) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              country.flagURL,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        } else {
                          return Image.network(country.coatOfArms);
                        }
                      }),
                    ),
                    const Center(child: ImageNavigator())
                  ])),
              const SizedBox(height: 24),
              DetailInfo('Population', country.population),
              const SizedBox(height: 16),
              DetailInfo('Region', country.region),
              const SizedBox(height: 16),
              DetailInfo('Subregion', country.subRegion),
              const SizedBox(height: 16),
              DetailInfo('Capital', country.capital),
              const SizedBox(height: 32),
              DetailInfo('Continent', country.continent),
              const SizedBox(height: 16),
              DetailInfo('Official language', country.language),
              const SizedBox(height: 16),
              DetailInfo('Area', country.area),
              const SizedBox(height: 16),
              DetailInfo('Currency', country.currency),
              const SizedBox(height: 32),
              DetailInfo('Time zone', country.timeZone),
              const SizedBox(height: 16),
              DetailInfo('Start of week', country.startOfWeek),
              const SizedBox(height: 16),
              DetailInfo('Driving side', country.drivingSide),
            ],
          ),
        ),
      ),
    );
  }
}
