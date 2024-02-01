import 'package:flutter/material.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/pages/cart_page.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/pages/home_page.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/pages/profile_page.dart';
import 'package:zaafer_mobile_app/features/shop/presentation/pages/wishlist_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<NavigationDestination> listLabel = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.favorite),
      label: 'Wishlist',
    ),
    NavigationDestination(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: listLabel,
        indicatorColor: Colors.transparent,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: const [HomePage(), WishlistPage(), ChartPage(), ProfilePage()][_currentIndex],
    );
  }
}
