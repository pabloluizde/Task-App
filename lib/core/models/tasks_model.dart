class TaksModel {
  TaksModel({
    required this.task,
    required this.description,
    required this.id,
    required this.dateCreate,
    this.isDone = false,
  });
  late final String? task;
  late final String? description;
  late final int? id;
  late bool isDone;
  late DateTime dateCreate;

  factory TaksModel.fromJson(Map<String, dynamic> json) {
    return TaksModel(
      id: json['id'],
      description: json['description'],
      isDone: json['isDone'],
      task: json['task'],
      dateCreate: DateTime.parse(json['dateCreate']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['isDone'] = isDone;
    _data['task'] = task;
    _data['dateCreate'] = dateCreate.toIso8601String();
    return _data;
  }
}
