import 'dart:developer';

import '../../style/colors.dart';
import '../../bloc/country_bloc.dart';
import '../../bloc/filter_values_cubit.dart';
import 'filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/bottomsheet_header.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHeader('Filter'),
          const SizedBox(height: 16),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: const [
                FilterItem(isContinent: true, item: 'Continent', filterValues: [
                  'Africa',
                  'Antartica',
                  'Asia',
                  'Australia',
                  'Europe',
                  'North America',
                  'South America'
                ]),
                FilterItem(
                    isContinent: false,
                    item: 'Time Zone',
                    filterValues: [
                      'UTC-12:00',
                      'UTC-11:00',
                      'UTC-10:00',
                      'UTC-08:00',
                      'UTC-06:00',
                      'UTC-05:00',
                      'UTC-04:00',
                      'UTC-03:00',
                      'UTC-02:00',
                      'UTC-01:00',
                      'UTC',
                      'UTC+00:00',
                      'UTC+01:00',
                      'UTC+02:00',
                      'UTC+03:00',
                      'UTC+04:00',
                      'UTC+05:00',
                      'UTC+06:00',
                      'UTC+07:00',
                      'UTC+08:00',
                      'UTC+09:00',
                      'UTC+10:00',
                      'UTC+11:00',
                      'UTC+12:00',
                      'UTC+13:00',
                    ]),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      context.read<FilterValues>().reset();
                      context.read<CountryBloc>().add(ResetCountries());
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(
                                width: 1.5,
                                color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color ??
                                    Colors.transparent))),
                    child: Text('Reset',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontWeight: FontWeight.normal)),
                  )),
              const SizedBox(width: 24),
              Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {
                      final values = context.read<FilterValues>().state;
                      final List<String> continents = values['continent']!;
                      final List<String> timeZones = values['timezone']!;
                      // log(continents.toString());
                      // log(timeZones.toString());
                      context
                          .read<CountryBloc>()
                          .add(FilterCountries(continents, timeZones));
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: orange,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: const Text('Show results',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
