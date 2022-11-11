import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/filter_values_cubit.dart';
import 'collapsed.dart';

class FilterItemExpanded extends StatelessWidget {
  const FilterItemExpanded({
    Key? key,
    required this.item,
    required this.filterValues,
    required this.isContinent,
  }) : super(key: key);
  final String item;
  final List<String> filterValues;
  final bool isContinent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterItemCollapsed(item: item),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              value: context
                  .watch<FilterValues>()
                  .state
                  .values
                  .expand((e) => e)
                  .contains(filterValues[index]),
              onChanged: (value) {
                isContinent
                    ? context
                        .read<FilterValues>()
                        .handleContinent(filterValues[index])
                    : context
                        .read<FilterValues>()
                        .handleTimezone(filterValues[index]);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(filterValues[index],
                  style: Theme.of(context).textTheme.bodyText2),
            );
          },
          itemCount: filterValues.length,
        ),
      ],
    );
  }
}
