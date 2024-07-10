import 'package:alex_sporting/Models/events_model.dart';
import 'package:alex_sporting/Models/prefrables_model.dart';
import 'package:alex_sporting/Models/teamsresults_model.dart';
import 'package:alex_sporting/Models/trips_model.dart';

class AllActivitiesModel {
  final List<EventsModel> events;
  final List<PreferablesModel> preferables;
  final List<TeamsResultsModel> teamsResults;
  final List<TripsModel> trips;

  AllActivitiesModel(
      {required this.events,
      required this.preferables,
      required this.teamsResults,
      required this.trips});

  factory AllActivitiesModel.fromjson(Map<String, dynamic> json) {
    // List<EventsModel> allEvents = [];
    // List ev = json['events'];
    // for (int i = 0; i < ev.length; i++) {
    //   allEvents.add(EventsModel.fromjson(ev[i]));
    // }



    return AllActivitiesModel(
      events: List<EventsModel>.from(json['events'].map((event) {
        return EventsModel.fromjson(event);
      })),
      preferables: List<PreferablesModel>.from(json['news'].map((preferable) {
        return PreferablesModel.fromjson(preferable);
      })),
      teamsResults: List<TeamsResultsModel>.from(json['teams'].map((team) {
        return TeamsResultsModel.fromjson(team);
      })),
      trips: List<TripsModel>.from(json['trips'].map((trip) {
        return TripsModel.fromjson(trip);
      })),
    );
  }
}
