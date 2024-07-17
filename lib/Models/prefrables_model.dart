import 'package:alex_sporting/Models/subcategories_model.dart';

class PreferablesModel {
  final String id;
  final String title;
  List<SubCategoriesModel> subcategories;

  PreferablesModel(
      {required this.id, required this.title, required this.subcategories});

  factory PreferablesModel.fromjson(Map<String, dynamic> json) {
    List<SubCategoriesModel> allSubs = [];
    List ev = json['subCategories'] ?? [];
    if(ev.isNotEmpty) {
      for (int i = 0; i < ev.length; i++) {
        allSubs.add(SubCategoriesModel.fromjson(ev[i]));
      }
    }
    return PreferablesModel(
      id: json['id'],
      title: json['title'],
      subcategories: allSubs,
    );
  }
}

