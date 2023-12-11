import 'package:flutter/material.dart';
import 'package:e_console_store/components/keyboard.dart';
import 'package:e_console_store/components/default_button.dart';
import 'package:e_console_store/constants/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';// TODO: backend!!!
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We will send to your email a link for new password",
                textAlign: TextAlign.center,
              ),
              ChangePasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  // final auth = FirebaseAuth.instance; TODO: backend!!!
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          DefaultButton(
            text: "Send to my email",
            press: () {
              //logic here
            },
          ),
        ],
      ),
    );
  }
}
