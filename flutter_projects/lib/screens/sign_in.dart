import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/bloc/login_bloc.dart';
import 'package:flutter_projects/screens/sign_up.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget{
@override
  signInState createState() => signInState();
}
class signInState extends State<SignIn>{
  GlobalKey<FormState>formKey = GlobalKey<FormState>();
@override
  Widget build(BuildContext context){
  final bloc = Provider.of<SignInBloc>(context, listen: false);
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

          Text("login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 30,),
          StreamBuilder<String>(
            stream: bloc.signInEmail,
            builder: (context, AsyncSnapshot<String>snapshot) =>
               TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText : "your email ",
                    labelText: "email",
                    errorText: snapshot.error.toString(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                 onChanged: (value) => bloc.newSignInEmail,
              ),
          ),
          SizedBox(height: 30,),
          StreamBuilder<String>(
            stream: bloc.signInPasskey,
            builder: (context, AsyncSnapshot<String>snapshot) =>
                TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                    hintText : "your passKey",
                    labelText: "password",
                    errorText: snapshot.error.toString(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                    onChanged: (value) => bloc.newSignInPasskey
              ),

          ),
          SizedBox(height: 30),
          buildLogInButton(),
          SizedBox(height: 30),
          RichText(
              text: TextSpan(children: [
                   TextSpan(
                     text: "new user?",
                     style: TextStyle(color: Colors.red)
                   ),
                WidgetSpan(child: SizedBox(width: 7)),
                TextSpan(
                    text: "open an account please..",
                    style: TextStyle(color: Colors.red),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (){
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => SignUp()));
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

 Widget buildLogInButton() {
  final bloc = Provider.of<SignInBloc>(context,listen: false);
  return StreamBuilder<Object>(
    stream: bloc.validItem,
    builder: (context, snapshot) {
      return GestureDetector(
      onTap: snapshot.hasError || !snapshot.hasData?null:
          (){
              bloc.submit();
      },
        child: Container(
         width: 150,
         height: 40,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: snapshot.hasError || !snapshot.hasData? Colors.redAccent: Colors.greenAccent
         ),
        alignment: Alignment.center,
        child: Text(
          "LogIn",
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