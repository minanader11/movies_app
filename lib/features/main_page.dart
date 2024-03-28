import 'package:flutter/material.dart';
import 'package:movies_routee/core/MyTheme.dart';
import 'package:movies_routee/features/browse/view/presentation/browse_tab.dart';
import 'package:movies_routee/features/home/home_tab.dart';
import 'package:movies_routee/features/search/search_tab.dart';
import 'package:movies_routee/features/watchlist/watchlist_tab.dart';

class MainPage extends StatefulWidget {
  static const String routeName='MainPage';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs=[const HomeTab(),const SearchTab(),const BrowseTab(), WatchlistTab()];
    return Scaffold(
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(canvasColor: MyTheme.blackColor),
        child: BottomNavigationBar(currentIndex: selectedIndex,onTap: (value){
          selectedIndex = value;
          setState(() {


          });

        } ,items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME'

          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH'

          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'BROWSE'
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/Icon ionic-md-bookmarks.png'),
              label: 'WATCHLIST'

          ),

        ]),
      ),
      body: tabs[selectedIndex],
    );
  }
}
