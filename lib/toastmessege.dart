import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{
  toastmessage({required String message}){
    Fluttertoast.showToast(msg: message);
  }
}