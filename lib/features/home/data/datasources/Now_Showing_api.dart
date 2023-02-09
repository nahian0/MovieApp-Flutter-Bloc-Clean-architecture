import 'package:dio/dio.dart';
import 'package:myapp/features/home/data/repositories/Now_Showing_reprositories.dart';
import 'dart:convert';
import 'package:http/http.dart';
import '../models/Now_Showing_model.dart';

// // Map mapresponce;

// // void fetchData() async {
// //   var dio = Dio();
// //   var ressponse = await dio.get(
// //       "https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1");
// //   print(ressponse.statusCode);
// //   print(ressponse.data.toString());
// // }
// //List<Property> PROJEKTE_LIST = [];

// class Api {
//   var dio = Dio();
//   void initDio() {
//     String baseUrl =
//         "https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1";
//     dio.options.baseUrl = baseUrl;
//     dio.options.headers['content-Type'] = 'application/json';
//     dio.options.connectTimeout = 50000;
//     dio.options.receiveTimeout = 30000;
//     dio.options.contentType = "keep-alive";
//     // dio.interceptors.add(LogInterceptor(responseBody: true));
//   }

//   Future<void> getData() async {
//     initDio();
//     await getresults();
//   }

//   Future<void> getresults() async {
//     try {
//       var response = await dio.get("results");
//       List<Property> results = propertyListFromJson(json.encode(response.data));
//       for (Property property in results) {
//         ResultList.add(property);
//       }
//     } catch (e) {
//       getresults();
//       print(e);
//     }
//   }
// }

class Api {
  String link =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1';

  Future<List<NowShowingModel>> getresults() async {
    var response = await Dio().get(link);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.data)['results'];
      print(result.map((e) => NowShowingModel.fromJson(e)).toList());
    } else {
      throw Exception(response.realUri);
    }
    return [];
  }
}
