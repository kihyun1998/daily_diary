// ignore_for_file: public_member_api_docs, sort_constructors_first
class SelectedDayState {
  final DateTime? selectedDay;
  final bool isSelected;
  SelectedDayState({
    this.selectedDay,
    required this.isSelected,
  });

  factory SelectedDayState.init() => SelectedDayState(
        selectedDay: null,
        isSelected: false,
      );

  SelectedDayState copyWith({
    DateTime? selectedDay,
    bool? isSelected,
  }) {
    return SelectedDayState(
      selectedDay: selectedDay ?? this.selectedDay,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
