import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market/core/nav_bar/logic/cubit/navigation_cubit.dart';
import 'package:market/core/nav_bar/logic/cubit/navigation_state.dart';
import 'package:market/features/favorite/ui/fav.dart';
import 'package:market/features/home/presentation/home.dart';
import 'package:market/features/profile/ui/profile.dart';
import 'package:market/features/store/ui/store.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final List<Widget> views = [
    const Home(),
    Store(),
    Fav(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          NavigationCubit nav = context.read<NavigationCubit>();

          return state.maybeWhen(
            orElse: () {
              return Scaffold(
                backgroundColor: Colors.blue[50],
                body: views[nav.currentIndex],
                bottomNavigationBar: Container(
                  color: Colors.white,
                  child: GNav(
                    onTabChange: (index) {
                      nav.chaneVeiws(index);
                    },
                    haptic: true, // haptic feedback
                    tabBorderRadius: 15,
                    curve: Curves.easeIn,
                    duration: const Duration(
                        milliseconds: 300), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: Colors.grey[600], // unselected icon color
                    activeColor: Colors.blue, // selected icon and text color

                    iconSize: 26, // tab button icon size
                    tabBackgroundColor: Colors.blue
                        .withOpacity(0.1), // selected tab background color
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
            },
          );
        },
      ),
    );
  }
}
