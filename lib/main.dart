// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movies_app/fetch_data.dart';
import 'package:provider/provider.dart';
// import 'package:tmdb_api/tmdb_api.dart';
import 'screens/home_screen.dart';

void main() async {
  final MoviesData moviesData = MoviesData();
  runApp(MyApp(moviesData));
}

class MyApp extends StatelessWidget {
  final MoviesData _moviesData;
  const MyApp(this._moviesData);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
