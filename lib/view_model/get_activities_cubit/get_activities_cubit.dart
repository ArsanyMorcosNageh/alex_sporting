import 'package:alex_sporting/Models/all_activities_model.dart';
import 'package:alex_sporting/Models/events_model.dart';
import 'package:alex_sporting/Models/subcategories_model.dart';
import 'package:alex_sporting/Models/trips_model.dart';
import 'package:alex_sporting/Services/sporting_service.dart';
import 'package:alex_sporting/Views/profile_events_screen.dart';
import 'package:alex_sporting/Views/profile_preferables_screen.dart';
import 'package:alex_sporting/Views/profile_teams_results_screen.dart';
import 'package:alex_sporting/Views/profile_trips_screen.dart';
import 'package:alex_sporting/components/pref_dialog.dart';
import 'package:alex_sporting/view_model/get_activities_cubit/get_activities_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/teamsresults_model.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(InitialActivitiesState());
  static ActivitiesCubit get(context) => BlocProvider.of(context);

  AllActivitiesModel? allActivitiesModel;
  int currentIndex = 0;
  List<Widget> pages = [];
  PageController pageController = PageController();

  getAllActivities(context) async {
    try {
      String token =
          'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MjExOTkwNzMsImV4cCI6MTcyMTI4NTQ3MywiaWQiOiIyMDExMDQwMzAyMDAifQ.1xUWxk1-hqBbptdcDL4UgBw4iInyV1jua0QAX5LlA8w';
      final headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };
      var response = await ActivitiesService()
          .dioGet('user/interests', queryParameters: {}, headers: headers);
      allActivitiesModel = AllActivitiesModel.fromjson(response['data']);
      pages = [
        PreferablesScreen(
          preferables: allActivitiesModel!.preferables,
          onTap: (val, index) => openPrefrablesDialog(val, context, index),
        ),
        TeamsResultsScreen(
          teams: allActivitiesModel!.teamsResults,
          editRecord: (team) => editTeamSelected(team),
        ),
        Trips(
          trips: allActivitiesModel!.trips,
          changeTripStatus: (trip) => editTripSelected(trip),
        ),
        Events(
          events: allActivitiesModel!.events,
          changeStatus: (event) => editEventsSelected(event),
        ),
      ];
      emit(ActivitiesLoadedState());
    } catch (e) {
      emit(ActivitiesFailureState());
    }
  }

  incrementIndex(int val) {
    if (val <= 3) {
      currentIndex = val;
      pageController.animateToPage(currentIndex, duration: const Duration(milliseconds: 150), curve: Curves.linear);
      emit(IndexIncremented());
    }
  }

  ///prefables functions
  selectAllPrefables(List<SubCategoriesModel> pref) {
    bool allSelected = true;
    for (var element in pref) {
      if (!element.selected) {
        allSelected = false;
      }
    }
    if (allSelected) {
      for (var element in pref) {
        element.selected = false;
      }
    } else {
      for (var element in pref) {
        element.selected = true;
      }
    }
    emit(SelectAll());
  }

  changePrefableSelected(SubCategoriesModel subPref) {
    subPref.selected = !subPref.selected;
    emit(ChangeOneItemStatus());
  }

  submitPrefsChanges(List<SubCategoriesModel> prefrables, context, index) {
    allActivitiesModel!.preferables[index].subcategories = prefrables;
    Navigator.pop(context);
  }

  openPrefrablesDialog(
      List<SubCategoriesModel> prefrables, BuildContext context, int index) {
    List<SubCategoriesModel> prefs = [];
    for (var e in prefrables) {
      prefs.add(
          SubCategoriesModel(id: e.id, title: e.title, selected: e.selected));
    }
    showDialog(
      context: context,
      builder: (context) {
        return PrefDialog(
          prefs: prefs,
          selectAll: (val) => selectAllPrefables(val),
          selectSingle: (val) => changePrefableSelected(val),
          submitChanges: (prefs, ctx) => submitPrefsChanges(prefs, ctx, index),
        );
      },
    );
  }

  ///teams functions
  editTeamSelected(TeamsResultsModel team) {
    team.selected = !team.selected;
  }

  ///trips functions
  editTripSelected(TripsModel trip) {
    trip.selected = !trip.selected;
  }

  ///events functions
  editEventsSelected(EventsModel event) {
    event.selected = !event.selected;
  }
}
