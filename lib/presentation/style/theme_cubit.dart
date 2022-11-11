import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void toggle() {
    final nextIndex = (state.index + 1) % ThemeMode.values.length;
    emit(ThemeMode.values[nextIndex]);
  }
}
