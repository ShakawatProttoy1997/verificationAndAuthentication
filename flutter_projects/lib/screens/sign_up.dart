import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/bloc/signup_bloc.dart';
import 'package:flutter_projects/screens/sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState>formKey = GlobalKey<FormState>();
  bool visible = true;
  @override
  Widget build(BuildContext context){
   final bloc  =  Provider.of<SignUpBloc>(context, listen: false);
    return Scaffold(
      key: formKey,
      body:Form(
        child:Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text("sign up",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                
                StreamBuilder<String>(
                  stream: bloc.signUpName,
                  builder: (context, AsyncSnapshot snapshot) =>
                     TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText : "your name ",
                          labelText: "name",
                          errorText: snapshot.error.toString(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                  onChanged: bloc.newSignUpName,
                    ),

                ),
                SizedBox(height: 30,),

                StreamBuilder<String>(
                  stream: bloc.signUpPhone,
                  builder: (context, AsyncSnapshot snapshot) =>
                     TextField(
                      keyboardType: TextInputType.phone,

                      decoration: InputDecoration(
                          hintText : "your phone",
                          labelText: "phone",
                          errorText: snapshot.error.toString(),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                       onChanged: bloc.newSignUpPhone,

                     ),

                ),
                SizedBox(height: 30,),
                StreamBuilder<String>(
                  stream: bloc.signUpEmail,
                  builder: (context, AsyncSnapshot snapshot) =>
                     TextField(
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                          hintText : "your email",
                          labelText: "email",
                          errorText: snapshot.error.toString(),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                       onChanged: bloc.newSignUpEmail,
                    ),

                ),
                SizedBox(height: 30,),
                StreamBuilder<String>(
                  stream: bloc.signUpPassword,
                  builder: (context, AsyncSnapshot snapshot) =>
                     TextField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: visible,
                      decoration: InputDecoration(
                          hintText : "your passKey",
                          labelText: "password",
                          errorText: snapshot.error.toString(),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        suffixIcon: IconButton(
                          icon: visible? Icon(Icons.visibility_off):
                              Icon(Icons.visibility),
                          onPressed: (){
                            setState(() {
                               visible = !visible;
                            });
                          },
                        )
                      ),

                       onChanged: bloc.newSignUpPassword,
                    ),

                ),
                SizedBox(height: 30),
                buildSignUpButton(),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "already user?",
                        style: TextStyle(color: Colors.red)
                    ),
                    WidgetSpan(child: SizedBox(width: 7)),
                    TextSpan(
                        text: "login please",
                        style: TextStyle(color: Colors.red),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SignIn())
                            );
                          }
                    )
                  ]),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget buildSignUpButton() {
    final bloc = Provider.of<SignUpBloc>(context, listen: false);
    return StreamBuilder<Object>(
      stream: bloc.validItems,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: snapshot.hasError || !snapshot.hasData? null
              : (){
               bloc.submit();
          },
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: snapshot.hasError || !snapshot.hasData?Colors.redAccent:Colors.greenAccent
            ),
            alignment: Alignment.center,
            child: Text(
              "sign Up",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.pink
              ),
            ),
          ),
        );
      }
    );
  }
}
