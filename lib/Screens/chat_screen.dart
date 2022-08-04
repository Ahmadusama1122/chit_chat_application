import 'package:chit_chat_application/Screens/chatpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class chatscreen extends StatefulWidget {
  const chatscreen({Key? key}) : super(key: key);

  @override
  _chatscreenState createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  late FirebaseMessaging messaging;
  @override
  Future<void> initstate() async {
    super.initState();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    await messaging.getToken().then((value){
    print(value);
    });
    await Firebase.initializeApp();

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print('Message Received');
      print('${event.notification!.body}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: chat_page()
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade500,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wifi_channel),
              label: 'channel',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],

      ),
    );
  }
}
