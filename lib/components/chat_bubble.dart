import 'package:flutter/material.dart';
import '../constant/const.dart';
import 'Message.dart';
class Chat_Bubble extends StatelessWidget {
  @override
  Messagess text ;
  Chat_Bubble(this.text);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text.email) ,
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(14),
            child: Text(text.message , style: TextStyle(color: Colors.white),),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue ,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),topLeft: Radius.circular(16),topRight: Radius.circular(16)),
            ),
          ),
        )
      ],
    );
  }
}
class Chat_Bubble_friend extends StatelessWidget {
  @override
  Messagess text ;
  Chat_Bubble_friend(this.text);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end ,
      children: [
        Text(text.email , style: TextStyle(color: Colors.black),) ,
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.all(14),
            child: Text(text.message , style: TextStyle(color: Colors.white),),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Kprimary_Color ,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),topLeft: Radius.circular(16),topRight: Radius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}
