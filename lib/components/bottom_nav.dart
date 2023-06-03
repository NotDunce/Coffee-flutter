import 'package:coffee_flutter/pages/cart_page.dart';
import 'package:coffee_flutter/pages/home_page.dart';
import 'package:coffee_flutter/pages/intro_page.dart';
import 'package:coffee_flutter/pages/login_page.dart';
import 'package:coffee_flutter/pages/qr_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pages/coffee_swipe.dart';
import '../pages/extra_home.dart';

class myNavBar extends StatefulWidget {
  const myNavBar({super.key});

  @override
  State<myNavBar> createState() => myNavBarState();
}

class myNavBarState extends State<myNavBar> {
  int _selectedIndex = 0;
 static  List<Widget> _widgetOptions = <Widget>[
    MainHome(),
    HomePage(),
    QrPage(),
    PickerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SafeArea(
        child: GNav(
          
          gap: 5,
          iconSize: 24,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.restaurant_menu,
              text: "Menu",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
              ),
              GButton(icon: Icons.favorite,
                text: "Generator",
              ),
          ],
          selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
        ),
      ),
    );
  }
}