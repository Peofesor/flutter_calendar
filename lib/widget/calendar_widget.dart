import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calendar/provider/event_provider.dart';
import 'package:calendar/model/event_data_source.dart';
import 'package:calendar/widget/tasks_widget.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
        view: CalendarView.month,
        dataSource: EventDataSource(events),
        initialSelectedDate: DateTime.now(),
        cellBorderColor: Colors.blue,
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.setDate(details.date!);

          showModalBottomSheet(
            context: context,
            builder: (context) => TasksWidget(),
          );
        });
  }
}

// List<Appointment> getAppointments() {
//   final List<Appointment> meetings = <Appointment>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 10, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));

//   meetings.add(Appointment(
//     startTime: startTime,
//     endTime: endTime,
//     subject: 'Meeting',
//     color: Colors.blue,
//     isAllDay: false,
//   ));

//   return meetings;
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
