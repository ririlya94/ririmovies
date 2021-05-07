
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_movies/screen/MovieGenre.dart';
import 'package:general_movies/screen/MovieListScreen.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
      // return MaterialPageRoute(builder: (_) => SplashScreen());

        return MaterialPageRoute(builder: (_)=>
            AnimatedSplashScreen(
              splash: 'assets/flutter_icon.jpg',
              nextScreen: MovieGenreScreen(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.scale,
              duration: 1000,
            )
        );
      case '/second':
      // return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Flutter Demo Home Page'));

        return MaterialPageRoute(
          builder: (context) {
            return MyHomePage(
                title: 'Flutter Demo Home Page'
            );
          },
        );
      case '/movieList':
        if(args is int){
          return MaterialPageRoute(
            builder: (_) => MovieLisScreen(
              id: args,
            ),
          );
        }
        return errorRoute();
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }

}