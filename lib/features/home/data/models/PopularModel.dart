import 'package:myapp/features/home/domain/entities/movieinfo.dart';

class PopularMovieModel extends Movieinfo {
  PopularMovieModel(
      {this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.id,
      this.genre_ids});

  PopularMovieModel.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    genre_ids = json['genre_ids'];
  }
  String? backdropPath;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteCount;
  num? voteAverage;
  List? genre_ids;

  get genreIds => null;
  PopularMovieModel copyWith(
          {String? backdropPath,
          num? id,
          String? originalLanguage,
          String? originalTitle,
          String? overview,
          num? popularity,
          String? posterPath,
          String? releaseDate,
          String? title,
          bool? video,
          num? voteAverage,
          num? voteCount,
          List? genre_ids}) =>
      PopularMovieModel(
          backdropPath: backdropPath ?? this.backdropPath,
          id: id ?? this.id,
          originalLanguage: originalLanguage ?? this.originalLanguage,
          originalTitle: originalTitle ?? this.originalTitle,
          overview: overview ?? this.overview,
          popularity: popularity ?? this.popularity,
          posterPath: posterPath ?? this.posterPath,
          releaseDate: releaseDate ?? this.releaseDate,
          title: title ?? this.title,
          video: video ?? this.video,
          voteAverage: voteAverage ?? this.voteAverage,
          voteCount: voteCount ?? this.voteCount,
          genre_ids: genre_ids ?? this.genre_ids);
}












// ignore_for_file: file_names

// class PopularMovieModel {
//   final String? backdropPath;
//   final List? genreIds;
//   final int? id;
//   final String? originalLanguage;
//   final String? originalTitle;
//   final String? overview;
//   final num? popularity;
//   final String? posterPath;
//   final String? releaseDate;
//   final String? title;
//   final bool? video;
//   final int? voteCount;
//   final String? voteAverage;

//   //String error;

//   PopularMovieModel({
//     required this.backdropPath,
//     required this.id,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.title,
//     required this.video,
//     required this.voteCount,
//     required this.voteAverage,
//     required this.genreIds,
//   });

//   factory PopularMovieModel.fromJson(dynamic json) {
//     return PopularMovieModel(
//         backdropPath: json['backdrop_path'],
//         id: json['id'],
//         originalLanguage: json['original_language'],
//         originalTitle: json['original_title'],
//         overview: json['overview'],
//         popularity: json['popularity'],
//         posterPath: json['poster_path'],
//         releaseDate: json['release_date'],
//         title: json['title'],
//         video: json['video'],
//         voteCount: json['vote_count'],
//         voteAverage: json['vote_average'].toString(),
//         genreIds: json['genre_ids']);
//   }
// }
