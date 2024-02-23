import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/Message.dart';
import '../components/chat_bubble.dart';
import '../constant/const.dart';

class Chat_Screen extends StatelessWidget {
  String ? email;
  static String id = "Chat Screen";

  Chat_Screen({this.email});

  final _con = ScrollController() ;

TextEditingController controller= TextEditingController() ;

  CollectionReference messages = FirebaseFirestore.instance.collection('messages');

bool test = true ;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:messages.orderBy("date",descending: true).snapshots() ,
      builder: (context,snapshot)
          {
            if (snapshot.hasData)
              {
                List <Messagess>Messageslist = [];
                for(int i = 0 ; i <snapshot.data!.docs.length ; i++)
                  Messageslist.add(Messagess.fromjson(snapshot.data!.docs[i]));
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Kprimary_Color,
                    automaticallyImplyLeading: false,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Kprimary_Logo,
                          height: 60,
                        ),
                        Text("Chat"),
                      ],
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _con,
                          itemBuilder: (context, index)
                          {
                            if (email == Messageslist[index].email)
                              {
                                return Chat_Bubble(Messageslist[index]) ;
                              }
                            else
                              {
                                return Chat_Bubble_friend(Messageslist[index]) ;
                              }
                          },
                          itemCount: Messageslist.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: TextField(
                          controller:controller ,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Kprimary_Color,
                                  )) ,
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Kprimary_Color,
                                  ))      ,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Kprimary_Color,
                                  )) ,
                              hintText: test == true ? "Type a message..": "Message"  ,
                              suffixIcon: IconButton(onPressed: (){
                                if(!controller.text.toString().isEmpty) {
                                  messages.add({
                                    'message': controller.text.toString(),
                                    "date": DateTime.now(),
                                    "email": email
                                  });
                                }
                                controller.clear();
                                _con.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                              },icon: Icon(Icons.send , color: Kprimary_Color,),)
                          ),
                          onSubmitted: (data){
                            if(!data.isEmpty)
                            {
                              messages.add({
                                'message': data,
                                "date": DateTime.now(),
                                "email":email
                              });
                            }
                            controller.clear() ;
                            _con.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          },
                        ),
                      ),
                    ],
                  ),
                ) ;
              }
            else
              {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Kprimary_Color,
                    automaticallyImplyLeading: false,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Kprimary_Logo,
                          height: 60,
                        ),
                        Text("Chat"),
                      ],
                    ),
                  ),
                );
              }
          },
    );
  }
}
