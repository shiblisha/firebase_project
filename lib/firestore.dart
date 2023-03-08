import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

import 'get_data_firestore.dart';
class Firestore extends StatefulWidget {
  const Firestore({Key? key}) : super(key: key);

  @override
  State<Firestore> createState() => _FirestoreState();
}TextEditingController text1=TextEditingController();
final ref=FirebaseDatabase.instance.ref('Texts');


class _FirestoreState extends State<Firestore> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: 80),
          child: Column(
            children: [
            Container(
            height: mheight * .4,
            width: mwidth * .95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,


                    hintText: 'Whats in youre mind',
                    hintStyle:
                    TextStyle(fontWeight: FontWeight.w900, fontSize: 15,color: Colors.teal)),
              ),
            ),
          ),
              Padding(
                padding:  EdgeInsets.only(top: 30),
                child: Container(
                    height: mheight * .05,
                    width: mwidth * .3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: Colors.grey),
                    child: TextButton(
                      onPressed: (){
                     },
                      child: Text(
                        'Post',

                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 20,left: 250),
                child: Container(
                  height: mheight * .05,
                  width: mwidth * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: Colors.grey),
                  child: TextButton(
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>Get_firestore())),

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
            ],
          ),
        ),
      ),
    );
  }
}
