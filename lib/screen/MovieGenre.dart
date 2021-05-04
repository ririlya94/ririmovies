import 'package:flutter/material.dart';

class MovieGenreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Movies")
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            RaisedButton(
                child: Text('Go to second'),
                onPressed: () => Navigator.pushNamed(context, "/second")
            )
          ],
        ),
      ),
    );
  }
}