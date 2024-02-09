import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pharma/profile.dart';
import 'cart.dart';
import 'med.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  int selected = 1;
  var pages = [profile(), med(), cart()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap Back Again to Exit App'),
        ),
        child: Center(
          child: pages[selected],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.white,
        color: Color(0xFF0024FC),
        height: 55,
        animationDuration: const Duration(milliseconds: 370),
        items: const [
          Icon(
            Icons.person_outline_rounded,
            color: Colors.white,
            size: 30,
          ),
          Icon(Icons.home_filled, color: Colors.white, size: 30),
          Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 30)
        ],
        onTap: (index) {
          setState(() {
            selected = index;
          }); // Handle button tap
        },
      ),
    );
  }
}
