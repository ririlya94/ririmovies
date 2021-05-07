
import 'dart:async';

import 'package:general_movies/services/ApiResponse.dart';
import 'package:general_movies/viewModel/MovieListViewModel.dart';
import 'package:general_movies/model/MovieListClass.dart';


class MovieListBloc{
    MovieListViewModel _movieListViewModel;
    StreamController _movieListController;

    StreamSink<ApiResponse<List<MovieListClass>>> get movieListSink => _movieListController.sink;
    Stream<ApiResponse<List<MovieListClass>>> get movieListStream => _movieListController.stream;

    MovieListBloc(int id){
        _movieListController = StreamController<ApiResponse<List<MovieListClass>>>();
        _movieListViewModel = MovieListViewModel();
        fetchmovieList(id);
    }

    fetchmovieList(int id) async{
        movieListSink.add(ApiResponse.loading('Fetching Movies'));
        try{
            List<MovieListClass> movies = await _movieListViewModel.fetchMovieList(id);
            movieListSink.add(ApiResponse.completed(movies));
        }
        catch(e){
            print(e.toString());
            movieListSink.add(ApiResponse.error(e.toString()));
        }
    }

    void dispose(){
        _movieListController?.close();
    }

}