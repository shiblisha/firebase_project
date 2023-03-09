import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: FirebaseAnimatedList(
            defaultChild: Center(child: CircularProgressIndicator()),
            query: ref,
            itemBuilder: (ctx, snapshot, index, animation) {
              return Card(
                elevation: 3,
                child: ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('title').value.toString()),
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
                                      Dialogbox(Id: snapshot.child('id').toString(), title: snapshot.child('title').toString());
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
                        icon: Icon(Icons.delete))),
              );
            }));
  }

  Future<void> Dialogbox({required String Id, required String title}) async {
    final newValue = TextEditingController();
    newValue.text = title;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: TextFormField(
              controller: newValue,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    ref.child(Id).update({'title': newValue.text.toLowerCase()});
                  },
                  child: Text('Update'))
            ],
          );
        });
  }
}
