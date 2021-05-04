import 'package:general_movies/components/GeneralFile.dart';
import 'package:general_movies/model/MovieGenreResponse.dart';
import 'package:general_movies/services/ApiBaseHelper.dart';
import 'package:general_movies/model/MovieGenreClass.dart';

class MovieGenreViewModel{
  final String _apiKey = apiKey;
  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<List<MovieGenreClass>> fetchGenreList() async{
    final response = await _apiBaseHelper.get("genre/movie/list?api_key=$_apiKey&language=en-US");
    return MovieGenreResponse.fromJson(response).movieGenreList;
  }
}