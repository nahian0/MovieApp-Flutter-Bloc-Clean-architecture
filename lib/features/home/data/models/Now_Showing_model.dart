import 'dart:convert';

Property propertyFromJson(String str) => Property.fromJson(json.decode(str));
List<Property> propertyListFromJson(String str) => List<Property>.from(
    json.decode(str)['data'].map((x) => Property.fromJson(x)));

String propertyToJson(Property data) => json.encode(data.toJson());

class Property {
  Property({
    this.title,
    this.vote_average,
    this.poster_path,
  });

  double? vote_average;
  String? title;
  String? poster_path;

  factory Property.fromJson(Map<String, dynamic> json) {
    String imageUrlPrefix =
        'https://image.tmdb.org/t/p/w500/' + json["poster_path"];
    return Property(
      title: json["title"] == null ? null : json["title"],
      vote_average: json["vote_average"] == null ? null : json["vote_average"],
      poster_path: json[" poster_path"] == null ? null : json[" poster_path"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "vote_average": vote_average == null ? null : vote_average,
        "subtitle": poster_path == null ? null : poster_path,
      };
}
