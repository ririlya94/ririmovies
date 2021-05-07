

import 'package:flutter/material.dart';
import 'package:general_movies/bloc/MovieListBloc.dart';
import 'package:general_movies/components/LoadingStateWidget.dart';
import 'package:general_movies/model/MovieListClass.dart';
import 'package:general_movies/services/ApiResponse.dart';
import 'package:general_movies/components/ErrorStateWidget.dart';

class MovieLisScreen extends StatefulWidget {
  MovieLisScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieLisScreen> {
  MovieListBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = MovieListBloc(widget.id);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
                'Movie List',
                style: TextStyle(fontSize: 28),
            ),
          ),

        body: RefreshIndicator(
          onRefresh: ()=> _bloc.fetchmovieList(widget.id),
          child: StreamBuilder<ApiResponse<List<MovieListClass>>>(
            stream: _bloc.movieListStream,
            builder: (context,snapshot){
              if(snapshot.hasData){
                switch(snapshot.data.status){
                  case Status.LOADING:
                    return Loading(loadingMessage: snapshot.data.message);
                    break;
                  case Status.COMPLETED:
                    return MovieList(movieList: snapshot.data.data);
                    break;
                  case Status.ERROR:
                    return Error(
                      errorMessage: snapshot.data.message,
                      onRetryPressed: () => _bloc.fetchmovieList(widget.id),
                    );
                    break;
                }
              }
              return Container();
            },
          ),
        ),

      );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MovieList extends StatelessWidget {
  final List<MovieListClass> movieList;
  const MovieList({Key key, this.movieList}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // onTap: () {
            //   Navigator.of(context).pushNamed(
            //     '/second',
            //     // arguments: genreList[index].id,
            //   );
            // },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  movieList[index].posterPath == null?
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png" :
                  'https://image.tmdb.org/t/p/original${movieList[index].posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}