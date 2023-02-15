import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [CategoriesScreen(), FavouritesScreen()];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //*If you want the TabBar at the bottom of the screen
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );

    //* If you want the TabBar on the top
    // return DefaultTabController(
    //   length: 2,

    //   //* This specifies which tab to open when the app is launched
    //   //* By default it is set 0
    //   initialIndex: 0,

    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('DeliMeals'),
    //       bottom: TabBar(tabs: [
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favourite',
    //         ),
    //       ]),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavouritesScreen(),
    //     ]),
    //   ),
    // );
  }
}
