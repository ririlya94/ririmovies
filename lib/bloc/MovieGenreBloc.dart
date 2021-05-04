import 'dart:async';

import 'package:general_movies/model/MovieGenreClass.dart';
import 'package:general_movies/services/ApiResponse.dart';
import 'package:general_movies/viewModel/MovieGenreViewModel.dart';

class MovieGenreBloc{
  MovieGenreViewModel _genreViewModel;
  StreamController _genreController;

  StreamSink<ApiResponse<List<MovieGenreClass>>> get genreListSink => _genreController.sink;
  Stream<ApiResponse<List<MovieGenreClass>>> get genreListStream => _genreController.stream;

  MovieGenreBloc(){
    _genreController = StreamController<ApiResponse<List<MovieGenreClass>>>();
    _genreViewModel = MovieGenreViewModel();
    fetchgenreList();
  }

  fetchgenreList() async{
      genreListSink.add(ApiResponse.loading('Fetching Genre'));
      try{
          List<MovieGenreClass> genre = await _genreViewModel.fetchGenreList();
          genreListSink.add(ApiResponse.completed(genre));
      }
      catch(e){
          genreListSink.add(ApiResponse.error(e.toString()));
          print(e.toString());
      }
  }

  dispose(){
    _genreController?.close();
  }


}