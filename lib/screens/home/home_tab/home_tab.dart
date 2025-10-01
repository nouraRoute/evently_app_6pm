import 'package:evently_app_6pm/models/event_model.dart';
import 'package:evently_app_6pm/screens/home/home_tab/views/events_list_view.dart';
import 'package:evently_app_6pm/screens/home/home_tab/views/home_header.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<EventModel> events = List.generate(
      5,
      (index) => EventModel(
        title: 'title$index',
        date: "22\nDEC",
        description: '',
        isFav: index % 2 == 0,
        catId: 2,
      ),
    );
    return Column(
      children: [
        HomeHeader(),
        EventsListView(events: events),
      ],
    );
  }
}
