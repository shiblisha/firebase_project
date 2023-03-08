import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Get_firestore extends StatefulWidget {
  const Get_firestore({Key? key}) : super(key: key);

  @override
  State<Get_firestore> createState() => _Get_firestoreState();
}

TextEditingController update = TextEditingController();
final ref = FirebaseDatabase.instance.ref('Texts');

class _Get_firestoreState extends State<Get_firestore> {
  @override
   Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
     var mwidth = MediaQuery.of(context).size.width;

     return Scaffold(
//         body: Card(
       //elevation: 3,
//       child: ListTile(
//           title: Text(snapshot.child('title').value.toString()),
//           subtitle: Text(snapshot.child('title').value.toString()),
//           leading: IconButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Dialog Title"),
//                       content: Container(
//                         height: mheight * .05,
//                         width: mwidth * .99,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.grey,
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10),
//                           child: TextFormField(
//                             controller: update,
//                             decoration: InputDecoration(
//                                 focusedBorder: InputBorder.none,
//                                 disabledBorder: InputBorder.none,
//                                 enabledBorder: InputBorder.none,
//                                 hintText: 'New value',
//                                 hintStyle: TextStyle(
//                                     fontWeight: FontWeight.w900, fontSize: 15)),
//                           ),
//                         ),
//                       ),
//                       actions: [
//                         GestureDetector(
//                           child: Text("Update"),
//                           onTap: () {
//                             update.text =
//                                 snapshot.child('title').value.toString();
//                             ref
//                                 .child(snapshot.child('id').toString())
//                                 .update({'title': update.text})
//                                 .then((value) => ToastMessage()
//                                     .toastmessage(message: 'UPDATED'))
//                                 .onError((error, stackTrace) => ToastMessage()
//                                     .toastmessage(message: error.toString()));
//                           },
//                           // },
//                         ),
//                         GestureDetector(
//                           child: Text("Close"),
//                           onTap: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               icon: Icon(Icons.update)),
//           trailing: IconButton(
//               onPressed: () {
//                 Dialogbox(
//                     Id: snapshot.child('id').toString(),
//                     title: snapshot.child('title').toString());
//               },
//               icon: Icon(Icons.delete))),
//     ));
//   }
//
//   Future<void> Dialogbox({required String Id, required String title}) async {
//     final newValue = TextEditingController();
//     newValue.text = title;
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Update'),
//             content: TextFormField(
//               controller: newValue,
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     ref
//                         .child(Id)
//                         .update({'title': newValue.text.toLowerCase()});
//                   },
//                   child: Text('Update'))
//             ],
             );
//         });
  }
}
