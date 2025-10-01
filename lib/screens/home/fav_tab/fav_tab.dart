import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/common/widgets/custom_text_field.dart';
import 'package:evently_app_6pm/models/event_model.dart';
import 'package:evently_app_6pm/screens/home/home_tab/views/events_list_view.dart';
import 'package:flutter/material.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<EventModel> events = List.generate(
      4,
      (index) => EventModel(
        title: 'title$index',
        date: "22\nDEC",
        description: '',
        isFav: index % 2 == 0,
        catId: index + 2,
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              hintText: 'Search for Event',
              borderColor: AppColors.mainColor,
              hintColor: AppColors.mainColor,
              prefixIcon: Icon(Icons.search, color: AppColors.mainColor),
            ),
          ),
          EventsListView(events: events),
        ],
      ),
    );
  }
}
