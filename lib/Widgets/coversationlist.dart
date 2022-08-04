import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class conversation_list extends StatefulWidget {
  String name;
  String messagetext;
  String imageurl;
  String time;
  bool isMessageRead;
  conversation_list({required this.name,required this.messagetext,required this.imageurl,required this.time,required this.isMessageRead});

  @override
  _conversation_listState createState() => _conversation_listState();
}

class _conversation_listState extends State<conversation_list> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: [
             CircleAvatar(
               backgroundImage: AssetImage(widget.imageurl),
             ),
            SizedBox(
              width: 16,
            ),
             Expanded(
                 child:Container(
                   color: Colors.transparent,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(widget.name,style: TextStyle(fontSize: 16),),
                       SizedBox(height: 6,),
                       Text(widget.messagetext,style: TextStyle(fontSize: 13,color:Colors.grey,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),)
                     ],
                   ),
                 )
             ),
            Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead ?FontWeight.bold:FontWeight.normal),)
          ],
        ),
      ),
    );
  }
}
