import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app_6pm/models/event_model.dart';

class EventsService {
  //create new event
  //delete
  //get events list
  //update event

  static CollectionReference<EventModel> _getEventsCollection() {
    CollectionReference<EventModel> collection = FirebaseFirestore.instance
        .collection('events')
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }

  static Future<void> createNewEvent(EventModel event) async {
    CollectionReference<EventModel> collection = _getEventsCollection();
    DocumentReference<EventModel> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  static Future<List<EventModel>> getAllEvents() async {
    CollectionReference<EventModel> collection = _getEventsCollection();
    QuerySnapshot<EventModel> snapshot = await collection.get();
    List<EventModel> events = snapshot.docs.map((e) => e.data()).toList();
    return events;
  }

  static Future<List<EventModel>> getFilteredEvents(int id) async {
    CollectionReference<EventModel> collection = _getEventsCollection();
    QuerySnapshot<EventModel> snapshot = await collection
        .where('catId', isEqualTo: id)
        .get();
    List<EventModel> events = snapshot.docs.map((e) => e.data()).toList();
    return events;
  }
}
