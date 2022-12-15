import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ChatScreen extends StatefulWidget {
  String? email;
  String? password;
  ChatScreen({
    this.email,
    this.password,
  });

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {

  final fireStore = FirebaseFirestore.instance;
  final String collectionName = 'chat';
  TextEditingController msgController = TextEditingController();
  addMsg(){
    fireStore.collection(collectionName).add({
      'msg': msgController.text,
      'senderID':widget.email,
      'time': FieldValue.serverTimestamp(),
    });
    msgController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Chat Screen'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),

        body:StreamBuilder<QuerySnapshot>(
            stream: fireStore.collection(collectionName).orderBy('time', descending: true).snapshots(),
            builder: (context,snapshot){
              return snapshot.hasData
                  ? chatBody(snapshot.data)
                  : snapshot.hasError
                  ? Text('ERROR')
                  :Center(child: CircularProgressIndicator());
            }
        )

    );
  }
  Widget chatBody(dynamic data)=> Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 10,
    ),
    child: Column(
      children: [
        Expanded(
          flex: 6,
          child: ListView.builder(
            itemCount: data.docs.length,
              reverse: true,
              itemBuilder: (context,indix){
              return Align(
                alignment: widget.email==data.docs[indix]['senderID']
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
                child: Text(data.docs[indix]['msg']??''),
              );
              },
            // time stamp dart
            // order by assigent
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: msgController,
                    decoration: InputDecoration(
                      label: Text('Enter Your Message '),
                      border: OutlineInputBorder(
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle
                    ),
                    child: IconButton(
                      padding:EdgeInsets.zero ,

                        onPressed: (){
                        addMsg();
                        },
                        icon:
                        Icon(Icons.send)
                    ),
                  )
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}