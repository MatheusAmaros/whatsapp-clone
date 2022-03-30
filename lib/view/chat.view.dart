import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/app.dart';

class ChatView extends StatefulWidget {
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController txtCtrl = new TextEditingController();

  bool showMicIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              reverse: true,
              children: [
                Text("oi"),
                Text("oi"),
                Text("oi"),
                Text("oi"),
                Text("oi")
              ],
            ),
          ),
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
                        : IconButton(onPressed: () {}, icon: Icon(Icons.send)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
