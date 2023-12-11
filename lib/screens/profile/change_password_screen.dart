import 'package:flutter/material.dart';
import 'package:e_console_store/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_console_store/screens/home/home_screen.dart';
import 'package:e_console_store/screens/profile/change_password_screen.dart';
import 'package:e_console_store/screens/profile/components/body.dart';
import 'package:e_console_store/screens/sign_in/sign_in_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: barColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
