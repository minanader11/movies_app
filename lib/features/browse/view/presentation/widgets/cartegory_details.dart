import 'package:flutter/material.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/core/api_service.dart';
import 'package:movies_routee/core/model/movieCategory.dart';
import 'package:movies_routee/features/browse/view/presentation/widgets/CategoryMovieItem.dart';


class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.category, required this.index});

  MovieCategory category;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.genres![index].name ?? '',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ApiService.getMoviesByCategory(category.genres![index].id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(children: [
              const Text('Something went wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiService.getMoviesByCategory(category.genres![index].id!);
                  },
                  child: const Text('Try again'))
            ]);
          } else if (snapshot.data!.success == false) {
            return Column(children: [
              Text(snapshot.data?.statusMessage ?? ''),
              ElevatedButton(
                  onPressed: () {
                    ApiService.getMoviesByCategory(category.genres![index].id!);
                  },
                  child: const Text('Try again'))
            ]);
          }
          var movies = snapshot.data!.results;
          return Container(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(color: MyTheme.grayColor, height: 1),
              ),
              scrollDirection: Axis.vertical,
              itemCount: movies!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryMovieItem(movie: movies[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
