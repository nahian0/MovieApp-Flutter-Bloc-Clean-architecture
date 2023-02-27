// import 'package:myapp/features/home/domain/entities/movieinfo.dart';

// class testModel extends Movieinfo {
//   testModel(
//       {this.backdropPath,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.releaseDate,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount,
//       this.id,
//       this.genre_ids});

//   testModel.fromJson(dynamic json) {
//     backdropPath = json['backdrop_path'];
//     id = json['id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//     genre_ids = json['genre_ids'];
//   }
//   String? backdropPath;
//   num? id;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   num? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   num? voteCount;
//   num? voteAverage;
//   List? genre_ids;

//   get genreIds => null;
//   testModel copyWith(
//           {String? backdropPath,
//           num? id,
//           String? originalLanguage,
//           String? originalTitle,
//           String? overview,
//           num? popularity,
//           String? posterPath,
//           String? releaseDate,
//           String? title,
//           bool? video,
//           num? voteAverage,
//           num? voteCount,
//           List? genre_ids}) =>
//       testModel(
//           backdropPath: backdropPath ?? this.backdropPath,
//           id: id ?? this.id,
//           originalLanguage: originalLanguage ?? this.originalLanguage,
//           originalTitle: originalTitle ?? this.originalTitle,
//           overview: overview ?? this.overview,
//           popularity: popularity ?? this.popularity,
//           posterPath: posterPath ?? this.posterPath,
//           releaseDate: releaseDate ?? this.releaseDate,
//           title: title ?? this.title,
//           video: video ?? this.video,
//           voteAverage: voteAverage ?? this.voteAverage,
//           voteCount: voteCount ?? this.voteCount,
//           genre_ids: genre_ids ?? this.genre_ids);
// }
