import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odc_formation/pages/auth/signUp_page.dart';

import '../activite/ActivitePage.dart';
import '../widget/Button.dart';
import '../widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
    final url = Uri.parse('http://localhost:8080/auth/login'); // Remplacez par la bonne IP

    try {
      print('Envoi de la requête avec: { "username": $username, "password": $password }');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      print('Statut de la réponse: ${response.statusCode}');
      print('Corps de la réponse: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print('Token: ${responseData['token']}');
        // Naviguer vers la page d'accueil après connexion réussie
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ActivityListScreen()),
        );
      } else {
        String errorMessage = 'Échec de l\'authentification';
        if (response.statusCode == 401) {
          errorMessage = 'Nom d\'utilisateur ou mot de passe incorrect';
        }
        throw Exception(errorMessage);
      }
    } catch (error) {
      print('Erreur de connexion: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de connexion: ${error.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("assets/images/login.png"),
              ),
              TextFieldInpute(
                textEditingController: _usernameController,
                hintText: "Entrer votre email",
                icon: Icons.email,
              ),
              TextFieldInpute(
                textEditingController: _passwordController,
                hintText: "Entrer votre mot de passe",
                isPass: true,
                icon: Icons.lock,
              ),
              Mybutton(
                onTap: () async {
                  String username = _usernameController.text.trim();
                  String password = _passwordController.text.trim();

                  print('Username: "$username"');
                  print('Password: "$password"');

                  if (username.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Veuillez entrer un nom d\'utilisateur et un mot de passe')),
                    );
                    return;
                  }

                  try {
                    await login(username, password);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erreur de connexion: ${e.toString()}')),
                    );
                  }
                },
                text: "Connexion",
              ),
            ],
          ),
        ),
      ),
    );
  }
}