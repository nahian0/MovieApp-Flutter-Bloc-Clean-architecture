// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:myapp/features/home/domain/entities/movieinfo.dart';

class NowPlayingMovieModel extends Movieinfo {
  NowPlayingMovieModel(
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

  NowPlayingMovieModel.fromJson(dynamic json) {
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
  NowPlayingMovieModel copyWith(
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
      NowPlayingMovieModel(
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























// class NowPlayingMovieModel {
//   final String? backdropPath;
//   final num? id;
//   final String? originalLanguage;
//   final String? originalTitle;
//   final String? overview;
//   final num? popularity;
//   final String? posterPath;
//   final String? releaseDate;
//   final String? title;
//   final bool? video;
//   final num? voteCount;
//   final num? voteAverage;
//   final List? genre_ids;

//   NowPlayingMovieModel(
//       {required this.backdropPath,
//       required this.id,
//       required this.originalLanguage,
//       required this.originalTitle,
//       required this.overview,
//       required this.popularity,
//       required this.posterPath,
//       required this.releaseDate,
//       required this.title,
//       required this.video,
//       required this.voteCount,
//       required this.voteAverage,
//       required this.genre_ids});

//   factory NowPlayingMovieModel.fromJson(dynamic json) {
//     return NowPlayingMovieModel(
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
//         voteAverage: json['vote_average'],
//         genre_ids: json['genre_ids']);
//   }
// }
