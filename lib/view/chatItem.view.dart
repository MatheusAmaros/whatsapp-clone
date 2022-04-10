import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/mensagem.model.dart';

class ChatItem extends StatelessWidget {
  final String message;
  final Color cor;

  ChatItem(this.message, this.cor);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cor,
          ),
          margin: const EdgeInsets.fromLTRB(13, 7, 21, 7),
          child: Text(message,
              style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)))),
    );
  }
}
