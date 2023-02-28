// ignore_for_file: file_names

import 'package:myapp/features/home/domain/entities/movieinfo.dart';

class GenresModel extends Genres {
  GenresModel({
    int? id,
    String? name,
  }) : super(
          id: id,
          name: name,
        );

  GenresModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  GenresModel copyWith({
    int? id,
    String? name,
  }) =>
      GenresModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
