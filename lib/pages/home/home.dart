import 'package:flutter/material.dart';
import 'package:odc_formation/pages/widget/Button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                'assets/images/Illustration.png', // Replace with your own image asset
                height: 200,
              ),
              Spacer(),
              // Welcome text
              Text(
                'Bienvenue sur Plateforme ODC Formation',
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
              Spacer(),
              // Dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(Colors.orange),
                  const SizedBox(width: 4),
                  buildDot(Colors.black87),
                  const SizedBox(width: 4),
                   buildDot(Colors.black87),
                ],
              ),
              const SizedBox(height: 40),
              // button
              Mybutton(onTab:(){} , text: "Suivant",),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDot(Color color) {
  return Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}

