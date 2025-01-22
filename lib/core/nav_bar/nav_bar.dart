import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: GNav(
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[600], // unselected icon color
          activeColor: Colors.blue, // selected icon and text color

          iconSize: 26, // tab button icon size
          tabBackgroundColor:
              Colors.blue.withOpacity(0.1), // selected tab background color
          tabMargin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 16), // navigation bar padding
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.store,
              text: 'store',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'favorite',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
