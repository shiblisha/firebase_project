import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

import 'get_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
TextEditingController text1=TextEditingController();
final ref=FirebaseDatabase.instance.ref('Texts');
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                  height: mheight * .4,
                  width: mwidth * .95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightGreenAccent,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 10),
                    child: TextFormField(controller: text1,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,


                          hintText: 'Whats in youre mind',
                          hintStyle:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                  ),
                ),
                ),
        Container(
          height: mheight * .05,
          width: mwidth * .3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey),
          child: TextButton(
            onPressed: (){
              String id=DateTime.now().microsecondsSinceEpoch.toString();
              ref.child(id).set(
                {
                  'title':text1.text,
                  'id':id
                }
              ).then((value) =>    ToastMessage().toastmessage(message:'POSTED')).onError((error, stackTrace) =>    ToastMessage().toastmessage(message: error.toString()));
            },
            child: Text(
              'Post',

              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )),
        Padding(
          padding:  EdgeInsets.only(top: 20,left: 250),
          child: Container(
          height: mheight * .05,
          width: mwidth * .3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey),
          child: TextButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Get_data())),

            child: Text(
              'Get Data',

              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            ),
          ),
        ),
      ]),
    )));
  }
}
