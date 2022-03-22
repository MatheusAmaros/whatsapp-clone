
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/mensagem.model.dart';

class MensagemItem extends StatelessWidget {
  
  final MensagemModel model;
  
  MensagemItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(13, 7, 21, 7),
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 55,
        height: 55,
        margin: const EdgeInsets.fromLTRB(2, 2, 8, 2),
        child: CircleAvatar(
          backgroundImage: NetworkImage(model.imageUrl!),
          backgroundColor: Color.fromARGB(255, 132, 0, 255),
          //radius: 27.5,
        ),
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( model.nome!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "Arial",
                )),
            SizedBox(
              height: 4,
            ),
            Text(model.ultimaMensagem!)
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
          Text(model.dataUltimaMensagem!.toString()),
          SizedBox(
            height: 4,
          ),
          CircleAvatar(
            radius: 11,
            child: Text(model.quantidadeNaoLida!.toString(),style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xFF1EBE71)
          //radius: 27.5,
        )
        ],
      )
    ],
      ),
    );
  }
}
