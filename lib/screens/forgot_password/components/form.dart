import 'package:flutter/material.dart';
import 'package:e_console_store/components/custom_surffix_icon.dart';
import 'package:e_console_store/components/default_button.dart';
import 'package:e_console_store/components/form_error.dart';
import 'package:e_console_store/components/no_account_text.dart';
// import 'package:firebase_auth/firebase_auth.dart'; TODO: backend!!!
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_console_store/constants/constants.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          emailField,
          SizedBox(height: 10),
          SizedBox(height: 10),
          DefaultButton(
            text: "Continue",
            press: () {
              //logic here
            },
          ),
          SizedBox(height: 10),
          NoAccountText(),
        ],
      ),
    );
  }
}
