import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

class Get_firestore extends StatefulWidget {
  const Get_firestore({Key? key}) : super(key: key);

  @override
  State<Get_firestore> createState() => _Get_firestoreState();
}

TextEditingController update = TextEditingController();
TextEditingController search = TextEditingController();
final ref = FirebaseFirestore.instance.collection('Post1');
final ref1 = FirebaseFirestore.instance.collection('Post1').snapshots();

class _Get_firestoreState extends State<Get_firestore> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    return Scaffold(resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextFormField(
            onFieldSubmitted: (value) {
              setState(() {});
            },
            controller: search,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Search',
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: ref1,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(
                'error',
                style: TextStyle(color: Colors.purple),
              );
            }
            if (snapshot.hasData) {print(snapshot.data!.docs.length);
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data!.docs[index]['title'].toString()),
                    leading: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        )),
                    trailing: TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        )),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
