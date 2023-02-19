import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _drawerDesign(IconData icon, String text, Function Handler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Handler();
        },
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _drawerDesign(
            Icons.restaurant as IconData,
            'Meals',
            () {
              //*What pushnamed does is that it pushes the page onto the
              //*stack of pages and therefore whenever we navigate between
              //* screens in the app, stack is growing continuously which
              //*may slow the app, there what pushReplacementNamed does is
              //* it pops the current page and pushes the page which is to
              //*be displayed. You can feel this change when you press the
              //*back button, if it is pushNamed, when you press back, it will
              //*simply pop the current page and show the page which is on top of
              //*stack, but if you will use pushreplacement, then you can't navigate
              //* to that page by simply pressing back button.
              // Navigator.of(context).pushNamed('/');
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: 20,
          ),
          _drawerDesign(
            Icons.filter as IconData,
            'Filter',
            () {
              // Navigator.of(context).pushNamed(FilterScreen.routeName);
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
              ;
            },
          ),
        ],
      ),
    );
  }
}
