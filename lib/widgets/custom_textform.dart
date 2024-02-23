import 'package:flutter/material.dart';

class Custom_Form extends StatelessWidget {
   Custom_Form({required this.text ,this.onchanged , this.eye = false}) ;
String ? text ;
Function(String)?onchanged ;
bool eye ;
   @override
  Widget build(BuildContext context) {
   if(text =="Email")
     return  TextFormField(
       onChanged: onchanged,
       validator: (data)
       {
         if(data!.isEmpty )
           return "The Email is Required" ;
         else if (!data.endsWith("@gmail.com"))
         {
           return "The Field Must End @gmail.com" ;
         }
       },
       decoration:InputDecoration(
         suffixIcon: Icon(Icons.email),
           hintText: text,
           hintStyle: TextStyle(color: Colors.white),
           border: OutlineInputBorder(),
           enabledBorder: OutlineInputBorder(
               borderSide: BorderSide(
                   color: Colors.white
               )
           ),
           label: Text("${text}")

       ),

     );
   else
     return  TextFormField(
       obscureText: eye,
       onChanged: onchanged,
       validator: (data)
       {
         if(data!.isEmpty )
           return "The Password is Required" ;

       },
       decoration:InputDecoration(
         suffixIcon:Icon(Icons.remove_red_eye) ,
           hintText: text,
           hintStyle: TextStyle(color: Colors.white),
           border: OutlineInputBorder(),
           enabledBorder: OutlineInputBorder(
               borderSide: BorderSide(
                   color: Colors.white
               )
           ),
           label: Text("${text}")

       ),

     );
  }
}
