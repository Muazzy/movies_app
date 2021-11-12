// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class TvShows extends StatelessWidget {
  final List tv;
  TvShows(this.tv);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TV Shows',
            style: kdefaultTitle,
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      // color: Colors.green,
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: tv[index]['backdrop_path'] != null
                                    ? NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                      )
                                    : kdefnetworkimg,
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 140,
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: tv[index]['name'] != null
                                ? Text(
                                    tv[index]['name'],
                                    style: kdefaultname,
                                  )
                                : Text(
                                    'Loading',
                                    style: kdefaultname,
                                  ),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
