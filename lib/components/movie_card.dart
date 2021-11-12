import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class MovieCard extends StatelessWidget {
  final String name;
  final String description;
  final String bannerurl;
  final String posterurl;
  final String rating;

  MovieCard({
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 7,
                    child: Text(
                      '⭐ Average Rating - $rating',
                      style: kdefaultTitle.copyWith(color: Colors.white),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    ));
  }
}
