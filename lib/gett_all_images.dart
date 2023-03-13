import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_project/upload_image.dart';
import 'package:flutter/material.dart';

class Getall_images extends StatefulWidget {
  const Getall_images({Key? key}) : super(key: key);

  @override
  State<Getall_images> createState() => _Getall_imagesState();
}

final ref = FirebaseDatabase.instance.ref('Post');

class _Getall_imagesState extends State<Getall_images> {

  @override
  Widget build(BuildContext context) {

    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FirebaseAnimatedList(
        defaultChild: const Center(child: CircularProgressIndicator()),
        query: ref,
        itemBuilder: (ctx, snapshot, index, animation) {
          final title = snapshot.child('title').value.toString();
          return Container(
            color: Colors.cyan,
            height: mheight * 0.5,
            width: mwidth * 0.9,
            child: Center(
              child: Text(title),
            ),
          );
        },
      ),
    );
  }
}
