import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/bottom_navigation_provider.dart';

BottomNavigationBar bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    onTap: (int index) =>
        Provider.of<BottomNavigationProvider>(context, listen: false)
            .bottomChangeIndex(index),
    selectedItemColor: Colors.white,
    currentIndex:
    Provider.of<BottomNavigationProvider>(context).bottomIndex,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search_sharp,
        ),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.download),
        label: 'Download',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_box),
        label: 'profile',
      ),
    ],
  );
}
