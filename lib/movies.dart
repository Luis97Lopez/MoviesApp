import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/omdb_movie.dart';
import 'dart:convert';

TextEditingController search = new TextEditingController();
List<OmdbMovie> movies = new List<OmdbMovie>();

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  @override
  void initState() {
    movies = new List<OmdbMovie>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Expanded(
                  flex: 5,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextInput(),
                          ElevatedButton(
                              onPressed: () {
                                searchMovies(search.text).then((value) {
                                  movies = value;
                                  setState(() {});
                                });
                              },
                              child: Text('Buscar'))
                        ],
                      ))),
              Expanded(
                  flex: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: movies.length == 0
                        ? Center(
                            child: Text('No Product to Display'),
                          )
                        : ListView.builder(
                            itemCount: movies.length,
                            reverse: false,
                            itemBuilder: (context, index) {
                              return Movie(movie: movies[index]);
                            },
                          ),
                  ))
            ])));
  }
}

class TextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      controller: search,
    ));
  }
}

Future<List<OmdbMovie>> searchMovies(text) async {
  List<OmdbMovie> movies = new List<OmdbMovie>();

  var key = '9b9c62c824525b6bea1c2bd136a38be6';
  var url =
      'https://api.themoviedb.org/3/search/movie?api_key=$key&language=es&query=$text';
  try {
    return http.get(Uri.parse(url)).then((response) async {
      final body = json.decode(response.body);
      for (var movieJson in body['results']) {
        movies.add(OmdbMovie.fromJson(movieJson));
      }
      return movies;
    });
  } catch (e) {
    print('Error api: ' + e.toString() + '.');
    return Future.value();
  }
}

class Movie extends StatelessWidget {
  final OmdbMovie movie;
  Movie({Key key, @required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('Abriendo la película:  ' + movie.id.toString());
        },
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              //border: Border.all()
              ),
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                      height: 200,
                      child: Column(children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '(' + movie.getYear() + ')',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(height: 8),
                        Text(movie.getOverview(),
                            style: TextStyle(fontSize: 15))
                      ]))),
              Expanded(
                  flex: 4,
                  child: Container(
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: movie.poster != "N/A"
                          ? Image.network(movie.poster)
                          : Image.network(
                              'https://www.tigoplay.com.hn/images/carousel/noimage_poster.png?_v=0.5.1'))),
              Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      decoration: const ShapeDecoration(
                        color: Colors.lightGreen,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          print('Agregar la película:  ' + movie.id.toString());
                        },
                      )))
            ],
          ),
        ));
  }
}
