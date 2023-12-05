import 'package:e_console_store/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              )),
          child: Text(
            "Sign In",
            style: TextStyle(fontSize: 16, color: primaryColor),
          ),
        ),
      ],
    );
  }
}
