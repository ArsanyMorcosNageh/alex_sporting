import 'package:alex_sporting/Views/events.dart';
import 'package:alex_sporting/Views/preferables.dart';
import 'package:alex_sporting/Views/teamsresults.dart';
import 'package:alex_sporting/Views/trips.dart';
import 'package:alex_sporting/view_model/get_activities_cubit/get_activities_cubit.dart';
import 'package:alex_sporting/view_model/get_activities_cubit/get_activities_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ActivitiesCubit()..getAllActivities(),
        child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
          builder: (context, state) {
            var cubit = ActivitiesCubit.get(context);
            if (state is ActivitiesLoadedState) {
              return PageView(
                reverse: true,
                children: <Widget>[
                  Preferables(preferables: cubit.allActivitiesModel!.preferables),
                  TeamsResults(teams: cubit.allActivitiesModel!.teamsResults),
                  Trips(trips: cubit.allActivitiesModel!.trips),
                  Events(events: cubit.allActivitiesModel!.events),
                ],
              );
            } else if (state is ActivitiesFailureState) {
              return Center(child: Text('Failed to load activities'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}