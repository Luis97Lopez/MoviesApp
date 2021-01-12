import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          heightFactor: 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeButton()
            ],
          )
        )
      )
    );
  }
}

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/movies/add');
        },
        child: Text('Movies')
      )
    );
  }
}


