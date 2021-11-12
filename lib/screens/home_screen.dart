// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies_app/components/discover.dart';
import 'package:movies_app/components/trending.dart';
import 'package:movies_app/components/tvshows.dart';
import 'package:movies_app/fetch_data.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
          ),
        ],
        title: Center(
          child: Text("Movie App <3"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          TrendingMovies(Provider.of<MoviesData>(context).getTrending),
          YouMayLike(Provider.of<MoviesData>(context).getPopular),
          TvShows(Provider.of<MoviesData>(context).getTvShows),
        ],
      ),
    );
  }
}
