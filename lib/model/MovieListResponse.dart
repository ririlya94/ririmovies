
import 'package:general_movies/model/MovieListClass.dart';

class MovieListResponse{
    List<MovieListClass> movieList;
    MovieListResponse({this.movieList});

    MovieListResponse.fromJson(Map<String,dynamic> json){
        movieList = new List<MovieListClass>();
        if(json['items'] != null){
            json['items'].forEach((v){
                movieList.add(MovieListClass.fromJson(v));
            });
        }
    }

}