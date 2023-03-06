import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({Key? key}) : super(key: key);

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

TextEditingController email = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;

class _Forgot_passwordState extends State<Forgot_password> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                  height: mheight * .05,
                  width: mwidth * .99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.email_rounded,
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: mheight * .05,
                  width: mwidth * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: TextButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      auth.sendPasswordResetEmail(email: email.text).then((
                          value) =>
                          ToastMessage().toastmessage(
                              message: 'PAssword changed succefully')).onError((
                          error, stackTrace) =>
                          ToastMessage().toastmessage(message: error.toString())
                          );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
