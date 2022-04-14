import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/mensagem.model.dart';
import 'package:whatsapp_clone/model/usuario.model.dart';

class MensagemItem extends StatelessWidget {
  final UsuarioModel model;

  MensagemItem(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(model.usuarios![0]);
        Navigator.of(context)
            .pushNamed('/chat', arguments: {'uuid': model.id});
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(13, 7, 21, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.fromLTRB(2, 2, 8, 2),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                backgroundColor: Color.fromARGB(255, 132, 0, 255),
                //radius: 27.5,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.nome!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Arial",
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text("ultima mensagem")
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Text(model.dataUltimaMensagem!.toString()),
                SizedBox(
                  height: 4,
                ),
                CircleAvatar(
                    radius: 11,
                    child: Text(
                      "model.quantidadeNaoLida!.toString()",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF1EBE71)
                    //radius: 27.5,
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
