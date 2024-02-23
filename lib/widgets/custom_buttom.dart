import 'package:flutter/material.dart';
class Custom_Bottom extends StatelessWidget {
  Custom_Bottom({required this.text, required this.function , }) ;
String ? text ;
VoidCallback ? function ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: function ,
        child: Text("${text}"),color: Colors.white,padding: EdgeInsets.all(18),shape:OutlineInputBorder(
        borderRadius: BorderRadius.circular(12)
    )) ;
  }
}
