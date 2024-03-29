import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:favorite_movie/model/movie_model.dart';

class MovieController {
  final String baseUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=5e30e788ba0016174d8c885253084699";

  Future<List<Movie>> getMovies() async {
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Movie> movies = [];
      for (var item in jsonData['results']) {
        Movie movie = Movie.fromJson(item);
        movies.add(movie);
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}