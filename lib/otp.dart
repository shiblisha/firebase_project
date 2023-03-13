import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:firebase_project/upload_image.dart';
import 'package:flutter/material.dart';

import 'firestore.dart';

class Otp_form extends StatefulWidget {
  final verificationId;
  const Otp_form({Key? key,required this.verificationId}) : super(key: key);

  @override
  State<Otp_form> createState() => _Otp_formState();
}
TextEditingController otp=TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;
class _Otp_formState extends State<Otp_form> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(left: 30, top: 80),
      child: Column(
        children: [
          Container(
            height: mheight * .05,
            width: mwidth * .8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(controller: otp,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Enter OTP',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
              ),
            ),
          ),
          SizedBox(
            height: mwidth * .1,
          ),
          Container(
              height: mheight * .05,
              width: mwidth * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: TextButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: ()async{
                    final credentials = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otp.text);
                    try{
                      await auth.signInWithCredential(credentials);
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Upload_image()));
                    }catch(e){
                      ToastMessage().toastmessage(message: e.toString());
                    }
                  })),
        ],
      ),
    )));
  }
}
