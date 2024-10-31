import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widget/Button.dart';
import '../widget/text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Ajoutez ce widget pour permettre le défilement
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Espacement au-dessus
                // Image or illustration
                Image.asset(
                  'assets/images/Forgot-password.png', // Remplacez par votre propre image
                  height: 250,
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
                TextFieldInpute(
                  textEditingController: _oldPasswordController,
                  hintText: "Ancien Mot De Passe",
                  isPass: true,
                  icon: Icons.lock,
                ),
                TextFieldInpute(
                  textEditingController: _newPasswordController,
                  hintText: "Nouveau Mot De Passe",
                  isPass: true,
                  icon: Icons.lock,
                ),
                TextFieldInpute(
                  textEditingController: _confirmPasswordController,
                  hintText: "Confirmer Mot De Passe",
                  isPass: true,
                  icon: Icons.lock,
                ),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                // Button
                Mybutton(
                  text: "Changé",
                  onTap: _resetPassword,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    final String oldPassword = _oldPasswordController.text;
    final String newPassword = _newPasswordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      setState(() {
        _errorMessage = "Les mots de passe ne correspondent pas.";
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/utilisateur/change-password'), // Remplacez par votre URL d'API
        headers: {
          'Content-Type': 'application/json',
          // Ajoutez d'autres en-têtes si nécessaire, comme le token d'authentification
        },
        body: jsonEncode({
          'ancienPassword': oldPassword, // Inclure l'ancien mot de passe
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        // Traitement en cas de succès
        Navigator.pop(context); // Retour ou redirection après succès
      } else {
        // Gestion des erreurs
        setState(() {
          _errorMessage = "Une erreur s'est produite. Veuillez réessayer.";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Erreur de connexion. Vérifiez votre réseau.";
      });
    }
  }
}
