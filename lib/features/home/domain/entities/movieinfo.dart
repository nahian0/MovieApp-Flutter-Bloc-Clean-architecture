import 'package:equatable/equatable.dart';

class Movieinfo extends Equatable {
  final String? backdropPath;
  final num? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteCount;
  final num? voteAverage;
  final List? genre_ids;

  // ignore: prefer_const_constructors_in_immutables
  Movieinfo(
      {this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.genre_ids});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
        genre_ids
      ];
}

class Genres extends Equatable {
  int? id;
  String? name;
  Genres({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
