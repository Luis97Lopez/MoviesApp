import 'package:flutter/material.dart';

TextEditingController search = new TextEditingController();

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();

}

class _AddMovieScreenState extends State<AddMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextInput(),
            SearchButton(),
          ]
        )
      )
    );
  }
}

class TextInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: search,
      )
    );
  }
}

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          print(search.text);
        },
        child: Text('Buscar')
      )
    );
  }
}
