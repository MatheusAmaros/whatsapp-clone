import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/chat.view.dart';
import 'package:whatsapp_clone/view/login.view.dart';
import 'package:whatsapp_clone/view/mensagem.view.dart';
import 'package:whatsapp_clone/view/register.view.dart';

class App extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //print(auth.currentUser!.uid);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          ChatView(), //auth.currentUser == null ? LoginView() : MensagemView(),
      routes: {
        '/login': (context) => LoginView(),
        '/message': (context) => MensagemView(),
        '/register': (context) => RegisterView(),
        //navigate = pilha
      },
    );
  }
}
