class SubCategoriesModel{

  final String id;
  final String title;
  bool selected;

  SubCategoriesModel({required this.id, required this.title, required this.selected});

  factory SubCategoriesModel.fromjson(Map<String, dynamic> json) {
    return SubCategoriesModel(
        id: json['id'], title: json['title'], selected: json['selected'] ?? false);
  }
}
