import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selectedday_provider.g.dart';

@riverpod
class SelectedDay extends _$SelectedDay {
  @override
  DateTime? build() {
    return null;
  }

  void onDaySelected({required DateTime selectedDay}) {
    state = selectedDay;
  }
}
