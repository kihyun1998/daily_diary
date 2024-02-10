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
    final selectedDay = ref.watch(selectedDayProvider).selectedDay;
    final isSelected = ref.watch(selectedDayProvider).isSelected;

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            print("tap");
            ref.read(selectedDayProvider.notifier).initSelected();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
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
                  onDaySelected: (selectedDay, focusDay) {
                    ref
                        .read(selectedDayProvider.notifier)
                        .onDaySelected(selectedDay: selectedDay);
                    ref
                        .read(focusDayProvider.notifier)
                        .onDaySelected(focusDay: focusDay);
                  },
                ),
                if (isSelected)
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: 350,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(10),
                          child: const Text("test"),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
