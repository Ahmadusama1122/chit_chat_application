import 'package:chit_chat_application/Models/UsersModel.dart';
import 'package:chit_chat_application/Screens/Chat_detail.dart';
import 'package:chit_chat_application/Widgets/coversationlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chat_page extends StatefulWidget {
  const chat_page({Key? key}) : super(key: key);

  @override
  _chat_pageState createState() => _chat_pageState();
}


class _chat_pageState extends State<chat_page> {
  List<Usersdata> userdata=[
    Usersdata('Donald', 'Hello', "Images/person.png", "Now"),
    Usersdata('tessa', 'okay', "Images/person2.png", "5:15"),
    Usersdata('joseph', 'Hello', "Images/person3.png", "Yesterday"),
    Usersdata('ahmad', 'Hello', "Images/person4.png", "28 june"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Conversations',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
                Container(
                  margin: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.pink[50],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add,color: Colors.pink,size: 20,),
                      SizedBox(width: 2,),
                      Text('Add new',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                    ],
                  ),
                )
              ],
            ),
          )),
          Padding(padding: EdgeInsets.only(top: 16,left: 16,right: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(Icons.search,color: Colors.grey.shade600,size: 20,),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  )
              ),
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                )
              )
            ),
          ),
          ),
          GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatdetail()));
                },
            child: ListView.builder(
               itemCount: userdata.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                itemBuilder: (context, index)
                {
                  return conversation_list(
                      name: userdata[index].name,
                      messagetext: userdata[index].messagetext,
                      imageurl: userdata[index].imageurl,
                      time: userdata[index].time,
                      isMessageRead: (index==0 || index==3) ? true:false,
                  );
                },
            ),
          )
        ],
      ),
    ));
  }
}
