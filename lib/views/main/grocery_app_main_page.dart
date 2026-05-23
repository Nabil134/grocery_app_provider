import 'package:flutter/material.dart';
import 'package:grocery_app/providers/bottom_navigation_provider.dart';
import 'package:grocery_app/views/cart_screen.dart';
import 'package:grocery_app/views/favorite_screen.dart';
import 'package:grocery_app/views/home/grocery_home_page.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class GroceryAppMainPage extends StatelessWidget {
  const GroceryAppMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider= context.watch<BottomNavigationProvider>();
    final List<Widget> pages=[
     const GroceryHomePage(),
    FavoriteScreen(),
     CartScreen(),
      const  Scaffold(
        body: Center(child: Text("Profile"),),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      /*bottomNavigationBar start here*/
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavigationProvider.selectedIndex,
        onTap: (value){
          bottomNavigationProvider.changeIndex(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home),
            activeIcon: Icon(Iconsax.home_2),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.heart),
            activeIcon: Icon(Iconsax.heart_copy),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.shopping_cart),
            activeIcon: Icon(Iconsax.shopping_cart_copy),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.profile_add),
            activeIcon: Icon(Iconsax.profile_add_copy),
            label: "Profile",
          ),
        ],),
      /*bottomNavigationBar end here*/
      body: pages[bottomNavigationProvider.selectedIndex],
    );
  }
}
