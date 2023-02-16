// ignore_for_file: file_names

class Genres_Model {
  final int? id;
  final String? name;

  Genres_Model({
    required this.id,
    required this.name,
  });

  factory Genres_Model.fromJson(dynamic json) {
    return Genres_Model(
      id: json['id'],
      name: json['name'],
    );
  }
}
