import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/filter_cubit.dart';

class FilterItemCollapsed extends StatelessWidget {
  const FilterItemCollapsed({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item, style: Theme.of(context).textTheme.bodyText1),
        IconButton(
            onPressed: () => context.read<FilterCubit>().toggleState(),
            icon: Icon(context.watch<FilterCubit>().state
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down))
      ],
    );
  }
}
