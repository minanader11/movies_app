
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_routee/core/api_constants.dart';
import 'package:movies_routee/core/model/movie.dart';
import 'package:movies_routee/core/model/movieCategory.dart';

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
      rethrow;
    }
  }
  static Future<MovieCategory> getGenres() async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.genre);

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movieCategory = MovieCategory.fromJson(data);
      return movieCategory;
    } catch (e) {
      rethrow;
    }
  }
  static Future<Movie> getMoviesByCategory(int id) async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.moviesByCategory,{
      'with_genres': id.toString()
    }
    );

    try {
      var response = await http
          .get(url, headers: {'Authorization': ApiConstants.authorization});
      var data = jsonDecode(response.body);
      var movies = Movie.fromJson(data);
      return movies;
    } catch (e) {
      rethrow;
    }
  }
  static Future<Movie> getSearchResults(String query) async {
    Uri url = Uri.https(ApiConstants.baseURl, ApiConstants.search,
    {
      'query' : query
    }
    );

    try {
      var response = await http
          .get(url,
          headers: {'Authorization': ApiConstants.authorization},


      );
      var data = jsonDecode(response.body);
      var results = Movie.fromJson(data);
      return results;
    } catch (e) {
      rethrow;
    }
  }

}