import 'package:chit_chat_application/Models/ChatMessageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatdetail extends StatefulWidget {
  const Chatdetail({Key? key}) : super(key: key);

  @override
  _ChatdetailState createState() => _ChatdetailState();
}

class _ChatdetailState extends State<Chatdetail> {
  List<ChatMessage> message=[
    ChatMessage("Hello", "receiver"),
    ChatMessage("How have you been?", "receiver"),
    ChatMessage("Hey kriss, I am doing fine dude. wbu?", "sender"),
    ChatMessage("Doing okay", "receiver"),
    ChatMessage("Is there any thing wrong?", "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16,top: 4),
            child: Row(
              children: [
                GestureDetector(
                   onTap: (){
                     Navigator.pop(context);
                   },
                    child: Icon(Icons.arrow_back_outlined,color: Colors.black,)),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/Images/person.png'),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Kriss Benwat',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(height: 2,),
                      Text('Online',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                    ],
                  ),
                ),
                Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
          ),
          body: Stack(
            children: [
              ListView.builder(
                  itemCount: message.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                    child: Align(
                      alignment: (message[index].messagetype=="receiver" ?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (message[index].messagetype=="receiver"?Colors.grey.shade200:Colors.blue[200])
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(message[index].messagecontent,style: TextStyle(fontSize: 15),),
                      ),
                    )
                  )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          child: Icon(Icons.add,color: Colors.white,size: 20,),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Write message......",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none
                            ),
                          )),
                      SizedBox(width: 15,),
                      FloatingActionButton(
                        onPressed: (){},
                        child: Icon(Icons.send,color: Colors.white,size: 18,),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
