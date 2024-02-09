import 'package:daily_diary/pages/home/provider/page_index_provider.dart';
import 'package:daily_diary/screens/calendar/calendar_page.dart';
import 'package:daily_diary/screens/table/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> pages = [
      const TableScreen(),
      const CalendarScreen(),
    ];

    final selectedIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomePage",
        ),
      ),
      body: pages[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (newIndex) {
          ref.read(pageIndexProvider.notifier).onDestinationSelected(newIndex);
        },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.table_chart), label: "Table"),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
        ],
      ),
    );
  }
}
