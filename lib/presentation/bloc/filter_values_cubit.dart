import 'package:flutter_bloc/flutter_bloc.dart';

class FilterValues extends Cubit<Map<String, List<String>>> {
  FilterValues() : super({'continent': [], 'timezone': []});

  void handleContinent(String val) {
    Map<String, List<String>> newMap = Map.from(state);
    if (state['continent']!.contains(val)) {
      newMap['continent']!.remove(val);
    } else {
      newMap['continent']!.add(val);
    }
    emit(newMap);
  }

  void handleTimezone(String val) {
    Map<String, List<String>> newMap = Map.from(state);
    if (state['timezone']!.contains(val)) {
      newMap['timezone']!.remove(val);
    } else {
      newMap['timezone']!.add(val);
    }
    emit(newMap);
  }

  void reset() {
    emit({'continent': [], 'timezone': []});
  }
}
