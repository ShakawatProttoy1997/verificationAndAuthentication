import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/sign_in.dart';
import 'package:flutter_projects/screens/welcome.dart';
import 'package:provider/provider.dart';

import 'bloc/login_bloc.dart';
import 'bloc/signup_bloc.dart';


void main() {
  runApp(const Alhamdulillah());
}

class Alhamdulillah extends StatelessWidget {
  const Alhamdulillah({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignInBloc>(create:(context)=> SignInBloc()),
        Provider<SignUpBloc>(create:(context)=> SignUpBloc()),

      ],

       child:MaterialApp(
        //debugShowCheckedModeBanner: false,
        title: 'User Login',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
         home: SignIn(),
      ),
    );
  }
}

