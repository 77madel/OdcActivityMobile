import 'package:flutter/material.dart';

import '../widget/Button.dart';
import '../widget/text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Image or illustration
              Image.asset(
                'assets/images/Forgot-password.png', // Replace with your own image asset
                height: 350,
              ),
              // Welcome text
              Text(
                'Créer un nouveau Mot De Passe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[Colors.orange, Colors.black87],
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Votre nouveau mot de passe doit être différent du mot de passe utilisé précédemment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[Colors.black87, Colors.black87],
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
              const SizedBox(height: 40),
              const TextFieldInpute(
                // textEditingController: ,
                  hintText: "Nouveau Mot De Passe",
                  isPass: true,
                  icon: Icons.lock
              ),
              const TextFieldInpute(
                // textEditingController: ,
                  hintText: "Confirmer Mot De Passe",
                  isPass: true,
                  icon: Icons.lock
              ),
              // button
              Mybutton(onTab:(){} , text: "Réinitialiser",),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
