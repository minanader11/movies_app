

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/core/api_constants.dart';
import 'package:movies_routee/core/model/movie.dart';

class CategoryMovieItem extends StatelessWidget {
  CategoryMovieItem({required this.movie});

  Result movie;

  @override
  Widget build(BuildContext context) {
    String imagePath = movie.backdropPath == null
        ? 'https://gordontredgold.com/wp-content/uploads/2021/08/broken-1.png'
        : ApiConstants.imagePath + movie.backdropPath!;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(onTap: () {
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //MovieItem(movie: widget.movie, index: 0),
          Container(clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child:/* Image.network(
              imagePath,
              height: height * 0.2,
              width: width * 0.35,
              fit: BoxFit.fill,
            ),*/
            CachedNetworkImage(
              fit: BoxFit.fill,
              height: height * 0.2,
              width: width * 0.35,
              imageUrl: imagePath,
              placeholder: (context, url) =>
                  Center(child: const CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          //Image.asset(
          //    'assets/images/movie.jpeg'),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title ?? '',
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(
                  height: 10,
                ),
                Text(movie.releaseDate ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: MyTheme.grayColor)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star_purple500_outlined,
                      color: MyTheme.goldColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      movie.voteAverage.toString() ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    /*Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            height: double.infinity,
            imageUrl: ApiConstants.imagePath + movie.backdropPath! ??
                'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=900',
            placeholder: (context, url) =>
                Center(child: const CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Column(
          children: [
            Text(
              movie.title ?? '',
            ),
            Text(
              movie.releaseDate ?? '',
            ),

          ],
        )
      ],
    );*/
  }
}
