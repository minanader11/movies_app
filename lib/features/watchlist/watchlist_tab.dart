import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/core/api_constants.dart';
import 'package:movies_routee/core/firebase_utils.dart';
import 'package:movies_routee/core/model/movie.dart';
import 'package:movies_routee/features/watchlist/watchlist_item.dart';

class WatchlistTab extends StatefulWidget {



  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  final Stream<QuerySnapshot> movieStream =
  FirebaseUtils.getMoviesCollection().snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WatchList',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: movieStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return WatchListItem(
                            movie:snapshot.data!.docs.map((DocumentSnapshot document) {
                              return Result(
                                backdropPath: document["backdrop_path"] == null ?
                                'https://gordontredgold.com/wp-content/uploads/2021/08/broken-1.png':
                                    ApiConstants.imagePath + document["backdrop_path"]
                                ,
                                title: document["title"],
                                releaseDate: document["release_date"],
                                voteAverage: document["vote_average"],
                              );
                            }).toList().elementAt(index),
                            id: snapshot.data!.docs.elementAt(index).id,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: MyTheme.grayColor,
                          thickness: 1,
                        );
                      },
                      itemCount: snapshot.data!.docs.length),
                );
              }

          )

        ],
      ),
    );
  }
}
