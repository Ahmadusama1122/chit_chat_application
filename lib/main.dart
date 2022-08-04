import 'package:chit_chat_application/Screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Mainscreen(),
    )
  );
}
class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: chatscreen(),
    );
  }
}
