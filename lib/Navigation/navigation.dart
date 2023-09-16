import 'package:flutter/material.dart';
import 'package:sell/AccountPage/account.dart';
import 'package:sell/AccountPage/test.dart';
import 'package:sell/HomeScreen/home_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import '../base_controller.dart';
import '../const/app_colors.dart';
import '../favoritePage/Favorite.dart';
import '../screen/bottomsheet.dart';
import '../shoppingcart/shopping.dart';


class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}
int index = 3;
class _NavigationState extends State<Navigation> {
  int _selectedIndex = 3;
  List<Widget> _widgetOptions = <Widget>[
    Test(),
    Favorite(),
    shopping(),
    Home(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     BaseController().initDB();

}
  @override
  Widget build(BuildContext context) {
    // List<Item> searchList = ITEM_LIST
    //     .where((element) =>
    //     element.name.toLowerCase().contains(text.toLowerCase()))
    //     .toList();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors. primaryColor,
        onPressed: () => ShowModalBottomSheeteeet(context),
        child: const Icon(Icons.call),

      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.user,
              size: 28,
            ),
            activeIcon: Icon(
              Iconsax.profile_add5,
              size: 28,
            ),
            label: 'الحساب ',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.lovely,
              size: 28,
            ),
            activeIcon: Icon(
              Iconsax.lovely5,
              size: 28,
            ),
            label: 'المفضله',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.shopping_cart,
              size: 28,
            ),
            activeIcon: Icon(
              Iconsax.shopping_cart5,
              size: 28,
            ),
            label: 'الـسلـة',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Iconsax.document,
          //     size: 28,
          //   ),
          //   activeIcon: Icon(
          //     Iconsax.document5,
          //     size: 28,
          //   ),
          //   label: 'الطلبات',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.home,
              size: 28,
            ),
            activeIcon: Icon(
              Iconsax.home5,
              size: 28,
            ),
            label: 'الرئيسية',
          ),

        ],


        unselectedItemColor: Colors.grey,
        selectedItemColor:AppColors. primaryColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle:
        GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
        selectedLabelStyle:
        GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
