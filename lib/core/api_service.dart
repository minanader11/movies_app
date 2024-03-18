
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_routee/core/api_constants.dart';
import 'package:movies_routee/core/model/movie.dart';
class ApiService{
  static Future<Movie> getPopularMovies()async {
    Uri url = Uri.https(ApiConstants.baseURl,ApiConstants.popular);

    try {
      var response = await http.get(url, headers: {
        'Authorization': ApiConstants.authorization
      });
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e){
      throw e;
    }
  }
}