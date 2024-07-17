import 'package:alex_sporting/Models/events_model.dart';
import 'package:alex_sporting/Models/prefrables_model.dart';
import 'package:alex_sporting/Models/teamsresults_model.dart';
import 'package:alex_sporting/Models/trips_model.dart';

class AllActivitiesModel {
  List<EventsModel> events;
  List<PreferablesModel> preferables;
  List<TeamsResultsModel> teamsResults;
  List<TripsModel> trips;

  AllActivitiesModel(
      {required this.events,
      required this.preferables,
      required this.teamsResults,
      required this.trips});

  factory AllActivitiesModel.fromjson(Map<String, dynamic> json) {
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
