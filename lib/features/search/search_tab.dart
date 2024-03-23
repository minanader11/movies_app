import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/core/api_service.dart';
import 'package:movies_routee/features/browse/view/presentation/widgets/CategoryMovieItem.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.08,
                bottom: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.height * 0.03,
                right: MediaQuery.of(context).size.height * 0.03
              ),
              child: TextField(
                onChanged: (text) {
                  ApiService.getSearchResults(text);
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.015),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 28,
                  ),
                  prefixIconColor: MyTheme.whiteColor,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: MyTheme.whiteColor),
                      borderRadius: BorderRadius.circular(35)),
                  hintText: "Search",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  filled: true,
                  fillColor: MyTheme.searchBarColor,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: MyTheme.whiteColor),
                      borderRadius: BorderRadius.circular(35)),
                ),
              ),
            ),
            FutureBuilder(
                future: ApiService.getSearchResults(searchController.text),
                builder: (context, snapshot) {
                  var resultsList = snapshot.data?.results ?? [];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                      child: CircularProgressIndicator());
                  } else if (resultsList.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/searchTabIcon.png"),
                          Text("No Movies Found",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w300, fontSize: 14))
                        ],
                      ),
                    );
                  }
                  else {
                    return ListView.separated(
                        // primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoryMovieItem(movie: resultsList[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: MyTheme.grayColor,
                            thickness: 1,
                          );
                        },
                        itemCount: resultsList.length);
                  }
                })
          ],
        ),
    );
  }
}
