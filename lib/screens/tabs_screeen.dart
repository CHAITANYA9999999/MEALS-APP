import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // final List<Widget> _pages = [CategoriesScreen(), FavouritesScreen()];
  final List<Map<String, Object>> _pages = [
    {'title': 'Categories', 'page': CategoriesScreen()},
    {'title': 'Favourites', 'page': FavouritesScreen()}
  ];
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
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page']! as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,

        //*If you are using the type as shifting, then you have to
        //*manually assign the background color to the items
        //backgroundColor: Theme.of(context).primaryColor,

        //* The one which is not selected should have the following color
        unselectedItemColor: Colors.white,

        //* The one which is not selected should have the following color
        selectedItemColor: Theme.of(context).accentColor,

        //*The app should know which one is selected
        currentIndex: _selectedPageIndex,

        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
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
