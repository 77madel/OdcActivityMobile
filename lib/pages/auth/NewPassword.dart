import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odc_formation/pages/auth/PasswordChange.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/Forgot-password.png',
                  height: 250,
                ),
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
                Mybutton(
                  text: "Changer",
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

    // Récupérer le token depuis SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');

    if (authToken == null) {
      setState(() {
        _errorMessage = "Vous devez être connecté pour changer le mot de passe.";
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/utilisateur/change-password'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken', // Envoyer le token d'authentification
        },
        body: jsonEncode({
          'ancienPassword': oldPassword,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        // Optionnel : Rediriger vers une autre page, par exemple la page de profil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Passwordchange()), // Remplacez par la page de destination
        ); // Redirection après succès
      } else if (response.statusCode == 401) {
        setState(() {
          _errorMessage = "Session expirée ou non autorisée.";
        });
      } else {
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