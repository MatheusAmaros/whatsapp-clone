import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/login.view.dart';
import 'package:whatsapp_clone/view/mensagem.view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
