import 'dart:ffi';

class MovieListClass{
  int id;
  String title;
  String posterPath;
  dynamic rating;

  MovieListClass({this.id,this.title,this.posterPath,this.rating});

  MovieListClass.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    posterPath = json['poster_path'];
    rating = json['vote_average'];
  }
}