import 'package:flutter/material.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/core/model/movieCategory.dart';
import 'package:movies_routee/features/browse/view/model/category_images.dart';
import 'package:movies_routee/features/browse/view/presentation/widgets/cartegory_details.dart';


class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({super.key, required this.index, required this.category});

  MovieCategory category;
  int index;
  List<String> imagePaths = CategoryImages.imagePaths;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryDetails(category: category, index: index),
      )),
      child: Container(clipBehavior: Clip.none,
        padding: EdgeInsets.only(top: height * 0.1),
        height: height * 0.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                imagePaths[index],
              ),
              fit: BoxFit.fill),
        ),
        child: Container(
          color: MyTheme.blackColor.withOpacity(0.4),
          child: Text(
            category.genres![index].name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: MyTheme.whiteColor),
          ),
        ),
      ),
    );
  }
}
