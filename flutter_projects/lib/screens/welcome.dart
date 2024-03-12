import 'package:flutter/material.dart';

class welcome extends StatelessWidget{
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [Image.asset('D:\flutter_projects\build\app\intermediates\assets\images\shakawat.png',
         fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
          const SafeArea(child: Text("welcome")
          )
        ],
      )


    );
  }

}