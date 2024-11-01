import 'package:flutter/material.dart';
import 'package:odc_formation/pages/profile/profile.dart';

class Passwordchange extends StatefulWidget {
  const Passwordchange({super.key});

  @override
  State<Passwordchange> createState() => _PasswordchangeState();
}

class _PasswordchangeState extends State<Passwordchange> {
  @override
  void initState() {
    super.initState();
    // Démarre un temporisateur de 3 secondes avant de rediriger
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profile()), // Remplacez par la page de destination
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration en haut
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  // Bouton retour
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.orange),
                      onPressed: () {
                        Navigator.pop(context); // Action pour revenir
                      },
                    ),
                  ),
                  // Image illustrant le succès
                  Image.asset(
                    'assets/images/Security.png', // Remplacer par votre image
                  ),
                ],
              ),
            ),
            // Texte de succès
            const Expanded(
              flex: 2,
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 150,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Succès',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mot De Passe changé',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Bouton de confirmation
            /* Mybutton(text: "Continue", onTap: () {  },) */
          ],
        ),
      ),
    );
  }
}