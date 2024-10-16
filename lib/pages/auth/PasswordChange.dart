import 'package:flutter/material.dart';
import 'package:odc_formation/pages/widget/Button.dart';

class Passwordchange extends StatelessWidget {
  const Passwordchange({super.key});

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
                        // Action pour revenir
                      },
                    ),
                  ),
                  // Image illustrant le succès (Remplacer par une image réseau ou locale)
                  Image.asset(
                    'assets/images/Security.png', // Remplacer par ton image
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
          Mybutton(onTab: (){}, text: "Continue")
          ],
        ),
      ),
    );
  }
}
