import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../view/screen/technicien/home/rendezvoustech.dart';

class EventController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;//pour creer un objet observable
  final events = <Event>[].obs;

  List<Event> get selectedEvents =>
      events.where((event) => isSameDay(event.date, selectedDate.value)).toList();

  bool hasEvents(DateTime day) {
    return events.any((event) => isSameDay(event.date, day));
  }

  bool isSameDay(DateTime dayA, DateTime dayB) {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    return dateFormatter.format(dayA) == dateFormatter.format(dayB);
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedDate.value = selectedDay;
  }

  void onRangeSelected(DateTime start, DateTime end, DateTime focusedDay) {
    final selectedDays = _getDaysInRange(start, end);
    selectedDate.value = focusedDay;
    events.addAll(selectedDays);
  }

  List<Event> _getDaysInRange(DateTime start, DateTime end) {
    final days = <Event>[];
    for (var i = 0; i <= end.difference(start).inDays; i++) {
      final day = start.add(Duration(days: i));
      days.add(
        Event(
          title: 'Rendez-vous',
          description: 'Description du rendez-vous',
          date: day,
        ), 
      );
    }
    return days;
  }

  void addEvent(Event event) {
    events.add(event);
  }
}