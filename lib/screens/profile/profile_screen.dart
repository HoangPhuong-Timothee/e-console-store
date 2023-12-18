import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:e_console_store/models/users.dart';
import 'package:e_console_store/models/users_model.dart';
import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/profile/change_password_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameHolder = TextEditingController();
  final addressHolder = TextEditingController();
  final phonenumberHolder = TextEditingController();

  clearTextInput() {
    nameHolder.clear();
    addressHolder.clear();
  }

  bool tappedYes = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Text("Profile Information",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Center(
              child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: primaryColor.withOpacity(0.15),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: ExactAssetImage('assets/images/logo.png'))),
              )
            ],
          )),
          FutureBuilder<User>(
            future:
                Users.getUserInst(auth.FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              final User? examQuestions = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError)
                    return Center(child: Text(snapshot.error.toString()));
                  else if (examQuestions != null)
                    return Text("Something =D!!!");
                  else
                    return Text("null");
              }
            },
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  width: 150,
                  height: 40,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: primaryColor),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          buttonTheme: ButtonTheme.of(context).copyWith(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap)),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(width: 2, color: primaryColor),
                        ),
                        child:
                            Text('Save', style: TextStyle(color: Colors.black)),
                        onPressed: () => {
                          if (nameHolder.text != "")
                            {
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(auth
                                      .FirebaseAuth.instance.currentUser!.uid)
                                  .update({"fullname": nameHolder.text}).then(
                                      (value) => print(
                                          "DocumentSnapshot successfully updated!"),
                                      onError: (e) =>
                                          print("Error updating document $e")),
                              Fluttertoast.showToast(
                                  msg: "Full name has changed "),
                            },
                          if (addressHolder.text != "")
                            {
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(auth
                                      .FirebaseAuth.instance.currentUser!.uid)
                                  .update({"address": addressHolder.text}).then(
                                      (value) => print(
                                          "DocumentSnapshot successfully updated!"),
                                      onError: (e) =>
                                          print("Error updating document $e")),
                              Fluttertoast.showToast(
                                  msg: "Address has changed "),
                            },
                          if (phonenumberHolder.text != "")
                            {
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(auth
                                      .FirebaseAuth.instance.currentUser!.uid)
                                  .update({
                                "phonenumber": phonenumberHolder.text
                              }).then(
                                      (value) => print(
                                          "DocumentSnapshot successfully updated!"),
                                      onError: (e) =>
                                          print("Error updating document $e")),
                              Fluttertoast.showToast(
                                  msg: "Phone Number has changed "),
                            }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 150,
                  height: 40,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.blue),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          buttonTheme: ButtonTheme.of(context).copyWith(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap)),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(width: 2, color: Colors.blue),
                        ),
                        child: Text('Cancel',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () => {clearTextInput()},
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  width: 150,
                  height: 40,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.green),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          buttonTheme: ButtonTheme.of(context).copyWith(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap)),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(width: 2, color: Colors.green),
                        ),
                        child: Text('Change Password',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(),
                              ))
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        color: Colors.red),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          buttonTheme: ButtonTheme.of(context).copyWith(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap)),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side: BorderSide(width: 2, color: Colors.red),
                          ),
                          child: Text('Log out',
                              style: TextStyle(color: Colors.black)),
                          onPressed: () async {
                            final action = await AlertDialogs.yesCancelDialog(
                                context, 'Logout', 'Are you sure to quit?');
                            if (action == DialogsAction.yes) {
                              setState(() => tappedYes = true);
                            }
                          }),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 5),
              Container(
                child: GestureDetector(
                  child: Text('View our website'),
                  onTap: () => _lauchURL(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _lauchURL() async {
    final Uri _url = Uri.parse('https://haloshop.vn/');
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  TextField buildTextField(String labletext, String placeholder) {
    return TextField(
      focusNode: new AlwaysDisabledFocusNode(),
      decoration: InputDecoration(
          labelText: labletext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  TextField buildTextFieldName(String labletext, String placeholder) {
    return TextField(
      controller: nameHolder,
      focusNode: new AlwaysFocusNode(),
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.edit),
          labelText: labletext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  TextField buildTextFieldAddress(String labletext, String placeholder) {
    return TextField(
      controller: addressHolder,
      focusNode: new AlwaysFocusNode(),
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.edit),
          labelText: labletext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  TextField buildTextFieldPhoneNumber(String labletext, String placeholder) {
    return TextField(
      controller: phonenumberHolder,
      focusNode: new AlwaysFocusNode(),
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.edit),
          labelText: labletext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class AlwaysFocusNode extends FocusNode {
  @override
  bool get hasFocus => true;
}
