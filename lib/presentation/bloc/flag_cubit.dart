import 'package:flutter_bloc/flutter_bloc.dart';

enum FlagImage { flag, coatOfArms }

class FlagCubit extends Cubit<FlagImage> {
  FlagCubit() : super(FlagImage.flag);

  void change() {
    final nextIndex = (state.index + 1) % FlagImage.values.length;
    emit(FlagImage.values[nextIndex]);
  }
}
