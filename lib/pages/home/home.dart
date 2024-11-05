import 'package:flutter/material.dart';
import 'package:odc_formation/pages/auth/login_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialisation de l'AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Boucle l'animation

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);

    // Navigation vers la page de connexion après 5 secondes
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()), // Remplacez par la page de destination
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose de l'AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(
              'assets/images/logo_odc.png', // Remplacez par votre propre image
              height: 250,
            ),
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