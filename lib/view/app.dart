import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/login.view.dart';
import 'package:whatsapp_clone/view/mensagem.view.dart';
import 'package:whatsapp_clone/view/register.view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/message': (context) => MensagemView(),
        '/register': (context) => RegisterView(),
      },
    );
  }
}
