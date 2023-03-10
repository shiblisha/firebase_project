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
TextEditingController search = TextEditingController();
final ref = FirebaseDatabase.instance.ref('Texts');

class _Get_dataState extends State<Get_data> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(onFieldSubmitted: (value){
          setState(() {

          });
        },
controller: search,
          onChanged: (value){
          setState(() {

          });
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
        body: FirebaseAnimatedList(
            defaultChild: const Center(child: CircularProgressIndicator()),
            query: ref,
            itemBuilder: (ctx, snapshot, index, animation) {
              final title = snapshot.child('title').value.toString();
              if (title.toLowerCase().contains(search.text.toLowerCase()))
                {
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
                                      Dialogbox(Id: snapshot.child('id').value.toString(), title: snapshot.child('title').value.toString());
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
                        onPressed: (){
                          ref.child(snapshot.child('id').value.toString()).remove();
                        },
                        icon: Icon(Icons.delete))),
              );}if(search.text.isEmpty){
              return  Card(
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
                                        Dialogbox(Id: snapshot.child('id').value.toString(), title: snapshot.child('title').value.toString());
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
                          onPressed: (){
                            ref.child(snapshot.child('id').value.toString()).remove();
                          },
                          icon: Icon(Icons.delete))),
                );
              }else{
                return Container();
              }
            }));
  }

  Future<void> Dialogbox({required String Id, required String title}) async {
    final newValue = TextEditingController();
    update.text = title;
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
                    ref.child(Id).update({'title': newValue.text.toLowerCase()
                    
                    
                    }).then((value) =>Navigator.of(context).pop()    ).onError((error, stackTrace) =>   ToastMessage().toastmessage(message: error.toString()));
                  },
                  child: Text('Update'))
            ],
          );
        });
  }
}
