import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focusday_provider.g.dart';

@riverpod
class FocusDay extends _$FocusDay {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void onDaySelected({required DateTime focusDay}) {
    state = focusDay;
  }
}
