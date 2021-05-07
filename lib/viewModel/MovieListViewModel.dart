
import 'package:general_movies/components/GeneralFile.dart';
import 'package:general_movies/services/ApiBaseHelper.dart';
import 'package:general_movies/model/MovieListClass.dart';
import 'package:general_movies/model/MovieListResponse.dart';

class MovieListViewModel{
  final String _apiKey = apiKey;
  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<List<MovieListClass>> fetchMovieList(int movieId) async{
    final response = await _apiBaseHelper.get("list/$movieId?api_key=$_apiKey&language=en-US");
    return MovieListResponse.fromJson(response).movieList;
  }
}