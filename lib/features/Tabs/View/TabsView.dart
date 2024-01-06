import 'package:crypto_app/core/Shared/Widgets/floatingNavigationBar/floating_navbar.dart';
import 'package:crypto_app/core/Shared/Widgets/floatingNavigationBar/floating_navbar_items.dart';
import 'package:crypto_app/features/AboutTab/View/AboutView.dart';
import 'package:crypto_app/features/ExploreTab/View/ExploreView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto_app/features/HomeTab/View/HomeView.dart';



class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  
  // Future<void> logout() async {
  //   final storage = new FlutterSecureStorage();
  //   Navigator.pushNamed(context, '/login');
  //   await storage.deleteAll();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Color.fromARGB(255, 31, 67, 98),
        selectedIconColor: Color(0xFFC8E6FF),
        unselectedIconColor: Color.fromARGB(255, 102, 123, 138),
        items: [
          FloatingNavBarItem(
              iconData: Icons.home_outlined, page: HomeView(), title: 'Home'),
          
          // FloatingNavBarItem(
          //     iconData: Icons.message_outlined,
          //     page: GroupView(),
          //     title: 'Groups'),
          FloatingNavBarItem(
              iconData: Icons.message_outlined,
              page: ExploreView(),
              title: 'Groups'),
          // FloatingNavBarItem(
          //     iconData: Icons.message_outlined,
          //     page: Leaderboard(),
          //     title: 'Groups'),
          FloatingNavBarItem(
              iconData: Icons.explore_outlined,
              page: AboutView(),
              title: 'Explore'),
        ],
        horizontalPadding: 40.0,
        borderRadius: 20.0,
        hapticFeedback: true,
        showTitle: false,
      ),
    );
  }
}