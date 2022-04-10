import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/mensagem.model.dart';
import 'package:whatsapp_clone/view/mensagemItem.view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MensagemView extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestore
            .collection('mensagens')
            .where('usuarios', arrayContains: auth.currentUser!.uid)
            .orderBy('dataUltimaMensagem', descending: true)
            .snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Erro");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) => MensagemItem(
                  MensagemModel.fromMap(snapshot.data!.docs[index].data())));
        },

        // separatorBuilder: (_,i) => Divider(),
        //  itemCount: mensagens.length,
        //  itemBuilder: (_, index) =>  MensagemItem(mensagens[index])
        //mensagens.map((m) => MensagemItem(m)).toList()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          auth.signOut();
          //Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
    );
  }
}
