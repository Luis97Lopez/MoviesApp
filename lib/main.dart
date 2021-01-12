import 'package:flutter/material.dart';
import 'welcome.dart';
import 'home.dart';
import 'movies.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/home' : (context) => HomeScreen(),
        '/movies/add' : (context) => AddMovieScreen()
      },
      initialRoute: '/welcome',
    );
  }
}
