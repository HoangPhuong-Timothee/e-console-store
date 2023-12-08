import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/cart/cart_screen.dart';
import 'package:e_console_store/screens/chat/chat_client.dart';
import 'package:e_console_store/screens/favorite/favorite_screen.dart';
import 'package:e_console_store/screens/home/components/categories.dart';
import 'package:e_console_store/screens/home/components/controller_and_accessory.dart';
import 'package:e_console_store/screens/home/components/new_arriaval_products.dart';
import 'package:e_console_store/screens/home/components/popular_products.dart';
import 'package:e_console_store/screens/profile/profile_screen.dart';
import 'package:e_console_store/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticky_float_button/sticky_float_button.dart';
// import 'package:firebase_auth/firebase_auth.dart'; //backend!!!

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final searchController = new TextEditingController();
  List<Widget> tabPages = [
    Home(),
    FavoriteScreen(),
    ClientMessageScreen(),
    ProfileScreen()
  ];
  String uid = '';
  //logic here backend
  @override
  Widget build(BuildContext context) {
    Widget _bottomTab() {
      return BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) => setState(() => _index = index),
        backgroundColor: barColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: iconColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home", backgroundColor: barColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: barColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chat",
              backgroundColor: barColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: barColor),
        ],
      );
    }

    return Scaffold(
        backgroundColor: barColor,
        appBar: AppBar(
          backgroundColor: barColor,
          leading: IconButton(
            onPressed: null,
            icon: SvgPicture.asset("assets/icons/logo.svg"),
          ),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        icon: Icon(Icons.search, color: iconColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(
                                    search_name: searchController.text),
                              ));
                        }),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, color: iconColor),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    hintText: 'Search items...',
                    border: InputBorder.none),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: iconColor,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
            ),
          ],
        ),
        body: Builder(builder: (context) {
          return Stack(children: [
            tabPages[_index],
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 12, bottom: 12),
              child: GestureDetector(
                onTap: () {}, //float button để thêm tính năng gì đó
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        Iconsax.personalcard5,
                        color: Colors.white,
                        size: 30,
                        shadows: [],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]);
        }),
        bottomNavigationBar: _bottomTab());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Categories(),
          const PopularProducts(),
          const NewArrivalProducts(),
          const ControllerAndAccessory(),
        ],
      ),
    );
  }
}
