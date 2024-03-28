import 'package:flutter/material.dart';
import 'package:movies_routee/core/api_service.dart';
import 'package:movies_routee/features/browse/view/presentation/widgets/category_grid_item.dart';


class BrowseGrid extends StatefulWidget {
  const BrowseGrid({super.key});

  @override
  State<BrowseGrid> createState() => _BrowseGridState();
}

class _BrowseGridState extends State<BrowseGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getGenres(),
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
                  ApiService.getGenres();
                  setState(() {

                  });

                },
                child: const Text('Try again'))
          ]);
        } else if (snapshot.data!.success == false) {
          return Column(children: [
            Text(snapshot.data!.statusMessage ?? ''),
            ElevatedButton(
                onPressed: () {
                  ApiService.getGenres();
                  setState(() {

                  });
                },
                child: const Text('Try again'))
          ]);
        }
        var genre = snapshot.data;

        return Container(

          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),

            scrollDirection: Axis.vertical,
            itemCount: genre!.genres!.length,
            itemBuilder: (context, index) {
              return //Text(genre.genres![index].name ??'');
                CategoryGridItem(index: index, category:genre );
            },
          ),
        );
      },
    );
  }
}
