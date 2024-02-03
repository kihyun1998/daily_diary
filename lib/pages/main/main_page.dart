import 'package:daily_diary/pages/calendar/calendar_page.dart';
import 'package:daily_diary/pages/diary/diary_page.dart';
import 'package:daily_diary/pages/home/home_page.dart';
import 'package:daily_diary/pages/main/provider/page_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> pages = [
      const HomePage(),
      const DiaryPage(),
      const CalendarPage(),
    ];

    final selectedIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomePage",
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (newIndex) {
          ref.read(pageIndexProvider.notifier).onDestinationSelected(newIndex);
        },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.book), label: "Diary"),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
        ],
      ),
    );
  }
}
