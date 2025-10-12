import 'package:evently_app_6pm/common/network/events_service.dart';
import 'package:evently_app_6pm/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<EventModel> eventsModel = [];
  bool isLoading = false;
  String? errorMessage;
  int selectedCatId = 1;
  Future<void> getEvents() async {
    isLoading = true;
    notifyListeners();

    try {
      eventsModel = await EventsService.getAllEvents();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;

    notifyListeners();
  }

  editSelectedCat(int catID) async {
    if (catID == selectedCatId) return;
    if (catID != 1) {
      selectedCatId = catID;
      isLoading = true;
      notifyListeners();

      try {
        eventsModel = await EventsService.getFilteredEvents(catID);
      } catch (e) {
        errorMessage = e.toString();
      }
      isLoading = false;

      notifyListeners();
    } else {
      getEvents();
    }
  }
}
