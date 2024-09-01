import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromARGB(255, 73, 219, 77),
      unselectedItemColor: Colors.black45,
      currentIndex: Get.currentRoute == '/home'
          ? 0
          : Get.currentRoute == '/categories'
              ? 1
              : Get.currentRoute == '/cart'
                  ? 2
                  : Get.currentRoute == '/profile'
                      ? 3
                      : 0,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/home');
            break;
          case 1:
            Get.toNamed('/categories');
            break;
          case 2:
            Get.toNamed('/cart');
            break;
          case 3:
            Get.toNamed('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined), label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
