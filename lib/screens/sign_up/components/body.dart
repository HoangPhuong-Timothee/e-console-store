import 'package:flutter/material.dart';
import 'package:e_console_store/components/have_account_text.dart';
import 'package:e_console_store/constants/constants.dart';
import 'form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text("Register Account", style: headingStyle),
                const Text(
                  "Complete your details to register",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const SignUpForm(),
                const SizedBox(height: 20),
                const HaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
