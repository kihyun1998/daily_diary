import 'package:daily_diary/screens/calendar/provider/state/selectday_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selectedday_provider.g.dart';

@riverpod
class SelectedDay extends _$SelectedDay {
  @override
  SelectedDayState build() {
    return SelectedDayState.init();
  }

  void onDaySelected({required DateTime selectedDay}) {
    state = state.copyWith(
      selectedDay: selectedDay,
      isSelected: true,
    );
  }

  void initSelected() {
    state = SelectedDayState.init();
  }
}
