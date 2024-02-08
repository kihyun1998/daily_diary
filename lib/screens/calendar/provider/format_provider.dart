import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'format_provider.g.dart';

@riverpod
class CalendarsFormat extends _$CalendarsFormat {
  @override
  CalendarFormat build() {
    return CalendarFormat.month;
  }

  void onFormatChanged({required CalendarFormat format}) {
    state = format;
  }
}
