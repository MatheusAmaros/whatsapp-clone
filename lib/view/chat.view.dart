import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/chat.model.dart';
import 'package:whatsapp_clone/view/app.dart';
import 'package:whatsapp_clone/view/chatItem.view.dart';
import 'package:whatsapp_clone/view/mensagemItem.view.dart';

class ChatView extends StatefulWidget {
  //ChatView({Key? key, @required this.uuid}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  TextEditingController txtCtrl = new TextEditingController();

  bool showMicIcon = true;

  void sendMessage(uidRec) async {
    var message = txtCtrl.text;
    print(txtCtrl.text);
    await firestore.collection('conversas').add({
      "message": message,
      "data": DateTime.now(),
      "email": auth.currentUser!.email,
      "usuarios": [
        auth.currentUser!.uid,
        uidRec,
      ]
    });
    txtCtrl.clear();

    //firestore.collection('conversas').doc('123').
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: firestore
                .collection('conversas')
                .where(
                  "usuarios",
                  arrayContains: auth.currentUser!.uid.toString(),
                )
                .orderBy("data", descending: true)
                .snapshots(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    if (snapshot.data!.docs[index].data()['usuarios'][0] ==
                        auth.currentUser!.uid.toString()) {
                      //
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ChatItem(snapshot.data!.docs[index].data()['message'],
                              Colors.green),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ChatItem(snapshot.data!.docs[index].data()['message'],
                              Color.fromARGB(255, 179, 178, 178)),
                        ],
                      );
                    }
                  },
                );
              }
            },
          )),
          Container(
            color: Colors.blue,
            height: 90,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(9, 0, 17, 0),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.attach_file))),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 172, 174, 173),
                        borderRadius: BorderRadius.circular(40)),
                    child: TextField(
                      controller: txtCtrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.tag_faces),
                      ),
                      onChanged: (value) {
                        if (value.isEmpty)
                          setState(() => showMicIcon = true);
                        else
                          setState(() => showMicIcon = false);
                      },
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(9, 0, 17, 0),
                    child: showMicIcon
                        ? IconButton(onPressed: () {}, icon: Icon(Icons.mic))
                        : IconButton(
                            onPressed: () =>
                                sendMessage(arguments['uuid'].toString()),
                            icon: Icon(Icons.send)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
