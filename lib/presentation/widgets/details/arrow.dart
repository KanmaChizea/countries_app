import '../../../core/colors.dart';
import '../../bloc/flag_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton(
    this.icon, {
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<FlagCubit>().change(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: lightGrey.withOpacity(0.5)),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}
