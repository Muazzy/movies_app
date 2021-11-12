// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class YouMayLike extends StatelessWidget {
  final List discover;
  YouMayLike(this.discover);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You May Like',
            style: kdefaultTitle,
          ),
          const SizedBox(height: 10),
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: discover.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Description(
                    //               name: trending[index]['title'],
                    //               bannerurl:
                    //                   'https://image.tmdb.org/t/p/w500' +
                    //                       trending[index]['backdrop_path'],
                    //               posterurl:
                    //                   'https://image.tmdb.org/t/p/w500' +
                    //                       trending[index]['poster_path'],
                    //               description: trending[index]['overview'],
                    //               vote: trending[index]['vote_average']
                    //                   .toString(),
                    //               launch_on: trending[index]
                    //                   ['release_date'],
                    //             )));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(10, 20)),
                            image: discover[index]['poster_path'] != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            discover[index]['poster_path']),
                                  )
                                : kdefaultimage,
                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: discover[index]['title'] != null
                              ? Text(
                                  discover[index]['title'],
                                  style: kdefaultname,
                                )
                              : const Text('Loading'),
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
