// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:movies_app/components/movie_card.dart';
import 'package:movies_app/constants.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  TrendingMovies(this.trending);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Movies',
            style: kdefaultTitle,
          ),
          const SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieCard(
                          name: trending[index]['title'] != null
                              ? trending[index]['title']
                              : 'Loading',
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          description: trending[index]['overview'],
                          rating: trending[index]['vote_average'].toString(),
                          // launch_on: trending[index]
                          //     ['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.elliptical(10, 20),
                            ),
                            image: trending[index]['poster_path'] != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']),
                                  )
                                : kdefaultimage,
                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: trending[index]['title'] != null
                              ? Text(
                                  trending[index]['title'],
                                  style: kdefaultname,
                                )
                              : Text(
                                  'Loading',
                                  style: kdefaultname,
                                ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
