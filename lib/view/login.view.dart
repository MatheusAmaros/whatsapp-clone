import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/mensagem.view.dart';

class LoginView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String email = '';
  String senha = '';

  void save() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // var result = await auth.createUserWithEmailAndPassword(
      //   email: email, password: senha);
      var result =
          await auth.signInWithEmailAndPassword(email: email, password: senha);
      //Navigator.push();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 4, 140, 8).withOpacity(0.5),
                  spreadRadius: 30,
                  blurRadius: 50,
                  offset: Offset(2, 7), // changes position of shadow
                ),
              ],
            ),
            width: 300,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 65, 55, 55),
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 202, 202, 202),
                      ),
                      onSaved: (value) => email = value!,
                      validator: (value) {
                        if (value!.isEmpty) return "Campo E-mail obrigatório";
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 65, 55, 55),
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 202, 202, 202),
                      ),
                      obscureText: true,
                      onSaved: (value) => senha = value!,
                      validator: (value) {
                        if (value!.isEmpty) return "Campo senha obrigatório";
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: save,
                      child: Text("Enter"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: Text("Cadastrar"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 54, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
