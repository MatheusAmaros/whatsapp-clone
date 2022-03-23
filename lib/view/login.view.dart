import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String email = '';
  String senha = '';

  void save() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var result = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      //var result = await auth.signInWithEmailAndPassword(email: email, password: senha);
      //print(result.user!.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onSaved: (value) => email = value!,
              validator: (value) {
                if (value!.isEmpty) return "Campo E-mail obrigatório";
                return null;
              },
            ),
            TextFormField(
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
            )
          ],
        ),
      ),
    );
  }
}