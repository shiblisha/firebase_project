import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';

class Get_data extends StatefulWidget {
  const Get_data({Key? key}) : super(key: key);

  @override
  State<Get_data> createState() => _Get_dataState();
}

TextEditingController update = TextEditingController();
final ref = FirebaseDatabase.instance.ref('Texts');

class _Get_dataState extends State<Get_data> {
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

    return Scaffold(body: FirebaseAnimatedList(
        defaultChild: Center(child: CircularProgressIndicator()),
        query: ref,
        itemBuilder: (ctx, snapshot, index, animation) {
          return Card(elevation: 3,
            child: ListTile(
                title: Text(snapshot
                    .child('title')
                    .value
                    .toString()),
                subtitle: Text(snapshot
                    .child('title')
                    .value
                    .toString()),
                leading: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Dialog Title"),
                            content: Container(
                              height: mheight * .05,
                              width: mwidth * .99,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: update,
                                  decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'New value',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15)),
                                ),
                              ),
                            ),
                            actions: [
                              GestureDetector(
                                child: Text("Update"),
                                onTap: () {
                                  update.text=snapshot.child('title').value.toString();
                                  ref.child(snapshot.child('id').toString()).update({'title': update.text})
                                      .then((value) => ToastMessage()
                                      .toastmessage(
                                  message: 'UPDATED'))
                                      .onError((error, stackTrace) =>
                                  ToastMessage().toastmessage(
                                  message: error.toString
                                  (
                                  )
                                  )
                                  );
                                },
                                // },
                              ),
                              GestureDetector(
                                child: Text("Close"),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.update)),
                trailing: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.add))),
          );
        }

      //     body: StreamBuilder(
      //   stream: ref.onValue,
      //   builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     if (snapshot.hasError) {
      //       return Text('Oops Something went wrong');
      //     }
      //     if (snapshot.hasData) {
      //       Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
      //       List<dynamic> list = [];
      //       list = map.values.toList();
      //       return ListView.builder(
      //           itemCount: list.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Card(
      //                 elevation: 3,
      //                 child: ListTile(
      //                   title: Text(list[index]['title'].toString()),
      //                   subtitle: Text(list[index]['id'].toString()),
      //                   leading: IconButton(
      //                       onPressed: () {
      //                         showDialog(
      //                           context: context,
      //                           builder: (BuildContext context) {
      //                             return AlertDialog(
      //                               title: Text("Dialog Title"),
      //                               content: Container(
      //                                 height: mheight * .05,
      //                                 width: mwidth * .99,
      //                                 decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.circular(20),
      //                                   color: Colors.grey,
      //                                 ),
      //                                 child: Padding(
      //                                   padding: EdgeInsets.only(left: 10),
      //                                   child: TextFormField(
      //                                     controller: update,
      //                                     decoration: InputDecoration(
      //                                         focusedBorder: InputBorder.none,
      //                                         disabledBorder: InputBorder.none,
      //                                         enabledBorder: InputBorder.none,
      //                                         hintText: 'New value',
      //                                         hintStyle: TextStyle(
      //                                             fontWeight: FontWeight.w900,
      //                                             fontSize: 15)),
      //                                   ),
      //                                 ),
      //                               ),
      //                               actions: [
      //                                 GestureDetector(
      //                                   child: Text("Update"),
      //                                   onTap: () {
      //                                     ref
      //                                         .child(snapshot.data!.snapshot
      //                                             .child(list[index]['id'])
      //                                             .toString())
      //                                         .update({'title': update.text})
      //                                         .then((value) => ToastMessage()
      //                                             .toastmessage(
      //                                                 message: 'UPDATED'))
      //                                         .onError((error, stackTrace) =>
      //                                             ToastMessage().toastmessage(
      //                                                 message: error.toString()));
      //                                   },
      //                                 ),
      //                                 GestureDetector(
      //                                   child: Text("Close"),
      //                                   onTap: () {
      //                                     Navigator.of(context).pop();
      //                                   },
      //                                 ),
      //                               ],
      //                             );
      //                           },
      //                         );
      //                       },
      //                       icon: Icon(Icons.update)),
      //                   trailing: IconButton(
      //                       onPressed: () {
      //                         ref
      //                             .child(snapshot.data!.snapshot
      //                                 .child(list[index]['id'])
      //                                 .toString())
      //                             .remove()
      //                             .then((value) => ToastMessage()
      //                                 .toastmessage(message: 'Deleted'))
      //                             .onError((error, stackTrace) => ToastMessage()
      //                                 .toastmessage(message: error.toString()));
      //                       },
      //                       icon: Icon(Icons.add)),
      //                 ));
      //           });
      //     } else {
      //       return SizedBox();
      //     }
      //   },
      // )
    ));
  }
}
