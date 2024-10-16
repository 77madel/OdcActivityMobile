import 'package:flutter/material.dart';

import '../widget/Button.dart';
import '../widget/text_field.dart';

class PasswordForgot extends StatefulWidget {
  const PasswordForgot({super.key});

  @override
  State<PasswordForgot> createState() => _PasswordForgotState();
}

class _PasswordForgotState extends State<PasswordForgot> {
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
                height: 400,
              ),
              const SizedBox(height: 40),
              // Welcome text
              Text(
                'Mot De Passe Oublie',
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
                'Entre votre adresse email pour réinitialiser votre Mot De Passe',
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
                  hintText: "Entrer your email",
                  icon: Icons.email
              ),
              // button
              Mybutton(onTab:(){} , text: "Envoyer Email",),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
