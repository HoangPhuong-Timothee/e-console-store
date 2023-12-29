import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({super.key});

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 62),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 28),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios,
                          size: 28, color: Colors.black),
                    ),
                    Spacer(),
                    Container(),
                  ],
                ),
                SizedBox(height: 6),
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      mes.name1,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24.0,
                          color: primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ]),
                SizedBox(height: 10),
                Container(
                  height: 640 - 31,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 93, 192, 225),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 400,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 32),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 28, right: 28),
                                      child: ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  SizedBox(height: 16),
                                          itemCount: chatting.length,
                                          itemBuilder: (context, index) {
                                            return (auth.FirebaseAuth.instance
                                                        .currentUser!.uid ==
                                                    chatting[index].userId)
                                                ? Container(
                                                    // padding: EdgeInsets.only(
                                                    //     left: 28, right: 28),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          chatting[index]
                                                              .createAt,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 10.0,
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth:
                                                                      264),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 16,
                                                                  left: 24,
                                                                  bottom: 16,
                                                                  right: 24),
                                                          // height: 73,
                                                          // width: 236 - 12,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24.0)),
                                                            color: Colors
                                                                .lightBlue,
                                                          ),
                                                          child: Text(
                                                            chatting[index]
                                                                .message,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: 12.0,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    // padding: EdgeInsets.only(
                                                    //     left: 28, right: 28),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          // height: 54,
                                                          // width: 172,
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth:
                                                                      254),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 16,
                                                                  left: 24,
                                                                  bottom: 16,
                                                                  right: 24),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24.0)),
                                                            color: Colors.grey,
                                                          ),
                                                          child: Text(
                                                            chatting[index]
                                                                .message,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: 12.0,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          chatting[index]
                                                              .createAt,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 10.0,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                          }),
                                    ),
                                  ],
                                ))),
                        Container(
                          height: 54,
                          width: 319 + 48,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 28, right: 28),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                            border: Border.all(color: Colors.black),
                            color: Colors.black,
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 28),
                              Expanded(
                                  child: Form(
                                key: messageFormKey,
                                child: TextField(
                                    controller: messageController,
                                    // onChanged: (value) => setState(() {
                                    //       message = value;
                                    //     }),
                                    onEditingComplete: () {
                                      setState(() {
                                        sendMessage();
                                        getMessage2();
                                        messageController.clear();
                                      });
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Type your message...",
                                    )),
                              )),
                              SizedBox(width: 20),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      // padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          icon: Icon(Iconsax.send1),
                                          iconSize: 18,
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              sendMessage();
                                              getMessage2();
                                              messageController.clear();
                                            });
                                            setState(() {});
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
