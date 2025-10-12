import 'package:evently_app_6pm/common/widgets/custom_main_button.dart';
import 'package:evently_app_6pm/providers/events_provider.dart';
import 'package:evently_app_6pm/screens/home/home_tab/views/events_list_view.dart';
import 'package:evently_app_6pm/screens/home/home_tab/views/home_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => EventsProvider()..getEvents(),
      child: Consumer<EventsProvider>(
        builder: (context, value, _) => Column(
          children: [
            HomeHeader(),
            if (value.isLoading)
              Expanded(child: Center(child: CircularProgressIndicator()))
            else if (value.errorMessage != null)
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Text(value.errorMessage!),
                      CustomMainButton(
                        text: 'Refers',
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              )
            else
              EventsListView(events: value.eventsModel),
          ],
        ),
      ),
    );
  }
}
