import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'home.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}
FirebaseAuth auth = FirebaseAuth.instance;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController username = TextEditingController();
class _Sign_upState extends State<Sign_up> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Container(
                height: mheight * .05,
                width: mwidth * .99,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextFormField(controller: username,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'User Name',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                ),
              ),
              SizedBox(
                height: mheight * .03,
              ),
              Container(
                  height: mheight * .05,
                  width: mwidth * .99,
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
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                  )),
              SizedBox(
                height: mheight * .03,
              ),
              Container(
                  height: mheight * .05,
                  width: mwidth * .99,
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
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                  )),
              SizedBox(
                height: mheight * .03,
              ),
              Container(
                height: mheight * .05,
                width: mwidth * .3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child:TextButton(
                  onPressed: () {
                    auth
                        .createUserWithEmailAndPassword(
                        email: email.text, password: password.text)
                        .then((value) => {

                          Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>Home())),
                      ToastMessage().toastmessage(message: 'Successfully registerd')
                    })
                        .onError((error, stackTrace) => ToastMessage()
                        .toastmessage(message: error.toString()));
                  },
                  child: Text ('Sgin Up',style: TextStyle(color: Colors.black,
                    fontSize: 15,fontWeight: FontWeight.w900

                  ),),
                ),
              ),
              SizedBox(
                height: mheight * .05,
              ),
              Container( height: mheight * .05,
                width: mwidth * .3,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
               child: TextButton(child: Text('go to login'),onPressed:()=>Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>Login())))),
            ],
          ),
        ),
      ),
    );
  }
}
