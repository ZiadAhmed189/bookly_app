import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constant/const.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';
import 'package:scholar_chat/widgets/custom_buttom.dart';
import '../widgets/custom_textform.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login_Screen extends StatefulWidget {
static String id = "Login Screen" ;

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
String ?email , password ;

bool Asy = false ;

GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Asy,
      child: Scaffold(
        backgroundColor:Kprimary_Color ,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key:formkey ,
            child: ListView(
              children: [
                SizedBox(height: 75,) ,
                Image.asset(Kprimary_Logo , height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Scholar Chat" , style: TextStyle(fontFamily: "Pacifico" , color: Colors.white , fontSize: 25),),
                  ],
                ),
                SizedBox(height: 25,),
                Text("Login" , style: TextStyle(fontFamily: "Pacifico" , color: Colors.white , fontSize: 25),),
                SizedBox(height: 22),
                Custom_Form(text: "Email" , onchanged: (data){email= data  ;}),
                SizedBox(height: 16),
                Custom_Form(eye: true,text: "Password"  , onchanged: (data) {password = data ; }),
                SizedBox(height: 16),
                Custom_Bottom(text: "Login" , function: ()async{
                  if(formkey.currentState!.validate())
                    {
                      setState(() {
                        Asy = true ;
                      });
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email!,
                            password: password! ,
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat_Screen(email: email,)));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user-not-found")));
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("wrong-password")));
                        }
                      }catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                        print(e);
                      }
                      setState(() {
                        Asy = false ;
                      });
                    }
                }) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don\'t Have Account ? ", style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, Register_Screen.id) ;
                    }, child: Text("Register", style: TextStyle(color: Colors.grey))) ,
                  ],
                ) ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
