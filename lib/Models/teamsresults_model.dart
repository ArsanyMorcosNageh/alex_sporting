class TeamsResultsModel {
  final String id;
  final String title;
  bool selected;

  TeamsResultsModel({required this.id, required this.title, required this.selected});

  factory TeamsResultsModel.fromjson(Map<String, dynamic> json) {
    return TeamsResultsModel(
        id: json['id'], title: json['title'], selected: json['selected']);
  }
}
