import 'package:general_movies/model/MovieGenreClass.dart';

class MovieGenreResponse{
    List<MovieGenreClass> movieGenreList;
    MovieGenreResponse({this.movieGenreList});

    MovieGenreResponse.fromJson(Map<String,dynamic> json){
      movieGenreList = new List<MovieGenreClass>();
      if(json['genres'] != null){
          json['genres'].forEach((v){
            movieGenreList.add(new MovieGenreClass.fromJson(v));
          });
        }
    }
}