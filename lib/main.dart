
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/login_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chat_app());

}
class chat_app extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    routes: {
      Login_Screen.id : (context)=>Login_Screen(),
      Register_Screen.id:(context)=>Register_Screen(),
      Chat_Screen.id :(context)=>Chat_Screen(),
    },
    initialRoute: Login_Screen.id,
    debugShowCheckedModeBanner: false,
  );
  }
}
