import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class Signup_number extends StatefulWidget {
  const Signup_number({Key? key}) : super(key: key);

  @override
  State<Signup_number> createState() => _Signup_numberState();
}
FirebaseAuth auth = FirebaseAuth.instance;
TextEditingController phone=TextEditingController();
class _Signup_numberState extends State<Signup_number> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 80),
        child: Column(children: [
          Container(
            height: mheight * .05,
            width: mwidth * .99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: TextFormField(controller: phone,
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                  ),
                  hintText: 'Phone number',
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
            ),
          ),
          SizedBox(
            height: mheight * .03,
          ),
          SizedBox(
            width: mwidth * .3,
          ),
          Container(
              height: mheight * .05,
              width: mwidth * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: TextButton(
                  child: Text(
                    'Get otp',

                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: (){
                    auth.verifyPhoneNumber(phoneNumber: phone.text,verificationCompleted: (_){},
                        verificationFailed: (e){
                          ToastMessage().toastmessage(message: e.toString());
                        },
                        codeSent: (String verificationId,int? token){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => Otp_form(verificationId: verificationId,)));


                        },
                        codeAutoRetrievalTimeout: (e){
                          ToastMessage().toastmessage(message: e.toString());
                        });
                  })),
        ]),
      ),
    ));
  }
}
