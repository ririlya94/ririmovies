import 'package:flutter/material.dart';
import 'package:general_movies/bloc/MovieGenreBloc.dart';
import 'package:general_movies/components/LoadingStateWidget.dart';
import 'package:general_movies/components/ErrorStateWidget.dart';
import 'package:general_movies/model/MovieGenreClass.dart';
import 'package:general_movies/services/ApiResponse.dart';

class MovieGenreScreen extends StatefulWidget {
  @override
  MovieGenreState createState() => MovieGenreState();
}

class MovieGenreState extends State<MovieGenreScreen> {
  MovieGenreBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = MovieGenreBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Genre")
      ),
      body: RefreshIndicator(
          onRefresh: ()=> _bloc.fetchgenreList(),
          child: StreamBuilder<ApiResponse<List<MovieGenreClass>>>(
              stream: _bloc.genreListStream,
              builder: (context,snapshot){
                  if(snapshot.hasData){
                      switch(snapshot.data.status){
                        case Status.LOADING:
                          return Loading(loadingMessage: snapshot.data.message);
                          break;
                        case Status.COMPLETED:
                          return GenreList(genreList: snapshot.data.data);
                          break;
                        case Status.ERROR:
                          return Error(
                            errorMessage: snapshot.data.message,
                            onRetryPressed: () => _bloc.fetchgenreList(),
                          );
                          break;
                      }
                  }
                  return Container();
              },
          ),
      )
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class GenreList extends StatelessWidget {
  final List<MovieGenreClass> genreList;
  const GenreList({Key key, this.genreList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return genreList.length > 0 ?ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: genreList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(child: Text('${genreList[index].title}')),
            );
          }
      )
      : Center(child: const Text('No items'));
  }

}