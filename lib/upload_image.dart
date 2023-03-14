

import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/toastmessege.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'gett_all_images.dart';
class Upload_image extends StatefulWidget {
  const Upload_image({Key? key}) : super(key: key);

  @override
  State<Upload_image> createState() => _Upload_imageState();
}
final picker = ImagePicker();
File? _image;
DatabaseReference databaseReference = FirebaseDatabase.instance.ref('post');
firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage
    .instance;
class _Upload_imageState extends State<Upload_image> {
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
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                    children: [
                Padding(
                padding: EdgeInsets.only(left: 5),
                child: GestureDetector(onTap: (){
                  getGalleryImage();
                },
                  child: Container(
                    child: _image != null
                        ? Image.file(
                      _image!.absolute,
                      fit: BoxFit.cover,
                    )
                    :
                    Icon(
                      Icons.image,size: 300,
                    ),
                    height: mheight * .4,
                    width: mwidth * .95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightGreenAccent,
                    ),),
                ),
                ),
                      Padding(
                        padding:  EdgeInsets.only(top: 20),
                        child: Container(
                            height: mheight * .05,
                            width: mwidth * .3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), color: Colors.grey),
                            child: TextButton(
                              onPressed: ()async{
                                final id=DateTime.now().microsecondsSinceEpoch.toString();
                                firebase_storage.Reference ref = firebase_storage
                                    .FirebaseStorage.instance.ref('/foldername/' + id);
                                firebase_storage.UploadTask uploadtask=ref.putFile(_image!.absolute);
                                await Future.value(uploadtask).then((value)async{
                                  var newUrl= await ref.getDownloadURL();
                                  print(newUrl.toString());
                                  databaseReference.child(id).set({
                                    'id':id,
                                    'title':newUrl.toString()
                                  }).then((value) => ToastMessage().toastmessage(message: 'Uploaded'));
                                });
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
                        padding:  EdgeInsets.only(left: 250,top: 20),
                        child: Container(
                          height: mheight * .05,
                          width: mwidth * .3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), color: Colors.grey),
                          child: TextButton(
                            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext a)=>See_All_Images())),

                            child: Text(
                              'Get All Images',style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black
                            ),
                            ),
                          ),

                        ),
                      )


                    ]))));
  }
  Future<void> getGalleryImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }
}
