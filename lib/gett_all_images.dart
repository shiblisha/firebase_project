import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class See_All_Images extends StatefulWidget {
  const See_All_Images({Key? key}) : super(key: key);

  @override
  State<See_All_Images> createState() => _See_All_ImagesState();
}

final ref = FirebaseDatabase.instance.ref('post');

class _See_All_ImagesState extends State<See_All_Images> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uploaded Images',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: mwidth * 0.94,
          height: mheight * 0.35,
          child: FirebaseAnimatedList(
            defaultChild: Center(
              child: CircularProgressIndicator(),
            ),
            query: ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              return Container(
                width: mwidth * 0.35,
                height: mheight * 0.4,
                child: Image.network(
                  snapshot.child('title').value.toString(),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

