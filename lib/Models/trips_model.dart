class TripsModel {
  final String name;
  final String value;
  bool selected;

  TripsModel({required this.name, required this.value, required this.selected});

  factory TripsModel.fromjson(Map<String, dynamic> json) {
    return TripsModel(
        name: json['name'] == 'Outer Trips' ? 'رحلات خارجية' : json['name'], value: json['value'], selected: json['selected']);
  }
}
