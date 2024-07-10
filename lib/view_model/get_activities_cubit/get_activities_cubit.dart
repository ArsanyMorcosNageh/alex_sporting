import 'package:alex_sporting/Models/all_activities_model.dart';
import 'package:alex_sporting/Services/sporting_service.dart';
import 'package:alex_sporting/view_model/get_activities_cubit/get_activities_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit() : super(InitialActivitiesState());
  static ActivitiesCubit get(context) => BlocProvider.of(context);

  AllActivitiesModel? allActivitiesModel;
  String title = '';
  getAllActivities() async {
    try {
      String token =
          'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MjA2MTAwODcsImV4cCI6MTcyMDY5NjQ4NywiaWQiOiIyMDExMDQwMzAyMDAifQ.SYG_1uMeomrbSv7YfZ2tL5b9FUUKEZGWIiIQXxnUYzs';
      final headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };
      var response = await ActivitiesService()
          .dioGet('user/interests', queryParameters: {}, headers: headers);
      allActivitiesModel = AllActivitiesModel.fromjson((response['data']));
      emit(ActivitiesLoadedState());
    } catch (e) {
      emit(ActivitiesFailureState());
    }
  }
}
