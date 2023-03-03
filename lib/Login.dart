import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: mheight * .05),
        child: Column(
          children: [
            Container(
                height: mheight * .05,
                width: mwidth * .98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextFormField(controller: email,
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
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                )),
            SizedBox(
              height: mheight * .05,
            ),
            Container(
                height: mheight * .05,
                width: mwidth * .98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextFormField(controller: password,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.key,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                )),
            SizedBox(
              height: mheight * .05,
            ),

            Container(
              height: mheight * .05,
              width: mwidth * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey),
              child:TextButton(
                onPressed: () { auth.signInWithEmailAndPassword(
                    email: email.text, password: password.text)
                    .then((value) => {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Home())),
                  ToastMessage().toastmessage(message: 'welcome')
                })
                    .onError((error, stackTrace) => ToastMessage()
                    .toastmessage(message: error.toString())); },
                child: Text ('Login',style: TextStyle(color: Colors.black,
                    fontSize: 15,fontWeight: FontWeight.w900

                ),),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
