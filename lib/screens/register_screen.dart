import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constant/const.dart';
import 'package:scholar_chat/widgets/custom_buttom.dart';
import '../widgets/custom_textform.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register_Screen extends StatefulWidget {
  static String id = "Register Screen" ;

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  String ?email , password ;

  bool ASync = false ;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: ASync,
      child: Scaffold(
        backgroundColor:Kprimary_Color ,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
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
                SizedBox(height: 25,) ,
                Text("Register" , style: TextStyle(fontFamily: "Pacifico" , color: Colors.white , fontSize: 25),),
                SizedBox(height: 22),
                Custom_Form(text: "Email",onchanged: (data){
                  email = data ;
                }),
                SizedBox(height: 16),
                Custom_Form(text: "Password",onchanged: (data){password = data ;}),
                SizedBox(height: 16),
                Custom_Bottom(text: "Register" , function: ()async{
                  if(formkey.currentState!.validate())
                    {
                      setState(() {
                        ASync = true ;
                      });
                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        Navigator.pop(context) ;
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Weak-password")));
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("email-already-in-use")));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
                        print(e);
                      }
                      setState(() {
                        ASync = false ;
                      });

                    }
                }) ,

              ],
            ),
          ),
        ),
      ),
    );
  }
}
