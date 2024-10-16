import 'package:flutter/material.dart';

import '../widget/Button.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

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

              //Image
              Image.asset(
                'assets/images/Illustration1.png',
                height: 400,
              ),

              //Text
              Text(
                'Le moyen intelligent et la meilleure compétence à atteindre',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[Colors.orange, Colors.black87],
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'N\'importe où, n\'importe quand. Le temps est à votre disposition La description pour étudier quand vous le souhaitez.',
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
              Spacer(),

              //point
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(Colors.black87),
                  const SizedBox(width: 4),
                  buildDot(Colors.orange),
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
