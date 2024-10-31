import 'package:flutter/material.dart';

import '../widget/Button.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

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
                'assets/images/Illustration2.png',
                height: 400,
              ),

              //Text
              Text(
                'Connectez-vous avec tout le monde',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[Colors.orange, Colors.black87],
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Restez toujours en contact avec votre tuteur et votre ami. Restons connectés !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[Colors.black87, Colors.black87],
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
              const Spacer(),

              //point
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(Colors.black87),
                  const SizedBox(width: 4),
                  buildDot(Colors.black87),
                  const SizedBox(width: 4),
                  buildDot(Colors.orange),
                ],
              ),
              const SizedBox(height: 40),
              // button
              Mybutton(text: "Suivant", onTap: () {  },),
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
