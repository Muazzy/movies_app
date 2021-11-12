import 'package:flutter/cupertino.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MoviesData extends ChangeNotifier {
  // final String apiKey = 'ff91b7cd8e64e2f80b2e57872d923142';
  // final String readAccessToken =
  //     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjkxYjdjZDhlNjRlMmY4MGIyZTU3ODcyZDkyMzE0MiIsInN1YiI6IjYxODAyZjI2MzlhMWE2MDA5MTdjY2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N5V-YFP7vbOSu3ualFSCv-75NdqVdxfnOfsw9NYGah4';
  List _trending = [];
  List _tvshows = [];
  List _popular = [];
  MoviesData() {
    loadData();
  }

  Future<void> loadData() async {
    final tmdbWithCustomLogs = TMDB(
      ApiKeys('ff91b7cd8e64e2f80b2e57872d923142',
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjkxYjdjZDhlNjRlMmY4MGIyZTU3ODcyZDkyMzE0MiIsInN1YiI6IjYxODAyZjI2MzlhMWE2MDA5MTdjY2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N5V-YFP7vbOSu3ualFSCv-75NdqVdxfnOfsw9NYGah4'),
      logConfig: ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map tvshowsResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPouplar();

    _trending = trendingResult['results'];
    notifyListeners();
    _tvshows = tvshowsResult['results'];
    // print(tvshowsResult);
    notifyListeners();
    _popular = popularResult['results'];
    notifyListeners();
    // print(trendingResult);
    notifyListeners();
  }

  List get getTrending {
    return _trending;
  }

  List get getTvShows {
    return _tvshows;
  }

  List get getPopular {
    return _popular;
  }
}
