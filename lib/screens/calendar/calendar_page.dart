import 'package:daily_diary/screens/calendar/provider/focusday_provider.dart';
import 'package:daily_diary/screens/calendar/provider/format_provider.dart';
import 'package:daily_diary/screens/calendar/provider/selectedday_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDay = ref.watch(focusDayProvider);
    final calendarFormat = ref.watch(calendarsFormatProvider);
    final selectedDay = ref.watch(selectedDayProvider);
    return Scaffold(
        body: TableCalendar(
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      selectedDayPredicate: (day) {
        return (isSameDay(selectedDay, day));
      },
      onFormatChanged: (format) {
        ref
            .read(calendarsFormatProvider.notifier)
            .onFormatChanged(format: format);
      },
      onDaySelected: (selectedDay, _) {
        ref
            .read(selectedDayProvider.notifier)
            .onDaySelected(selectedDay: selectedDay);
      },
    ));
  }
}
