class EventsModel {
  final String id;
  final String title;
  bool selected;

  EventsModel({required this.id, required this.title, required this.selected});

  factory EventsModel.fromjson(Map<String, dynamic> json) {
    return EventsModel(
        id: json['id'], title: json['title'], selected: json['selected']);
  }
}