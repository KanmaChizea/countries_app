import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/filter_cubit.dart';
import 'collapsed.dart';
import 'expanded.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
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
    return BlocProvider(
      create: (_) => FilterCubit(),
      child: Builder(builder: (context) {
        return AnimatedCrossFade(
            firstChild: FilterItemCollapsed(item: item),
            secondChild: FilterItemExpanded(
                filterValues: filterValues,
                item: item,
                isContinent: isContinent),
            crossFadeState: context.watch<FilterCubit>().state
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300));
      }),
    );
  }
}
