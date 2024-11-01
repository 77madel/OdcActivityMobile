import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:odc_formation/pages/auth/NewPassword.dart';
import 'package:odc_formation/pages/auth/login_page.dart';
import 'package:odc_formation/pages/home/home.dart';
import 'package:odc_formation/pages/profile/information.dart';
import 'package:odc_formation/pages/widget/Button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/PasswordChange.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nom = "Utilisateur"; // Valeur par défaut
  String sub = "utilisateur@example.com"; // Valeur par défaut

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      _loadUserInfo();
    });
  }

  Future<void> storeToken(String bearerToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', bearerToken);
    print('Token stocké: $bearerToken');
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    print('Token récupéré: $token');

    if (token != null && !JwtDecoder.isExpired(token)) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      setState(() {
        nom = decodedToken['nom'] ?? "Utilisateur";
        sub = decodedToken['sub'] ?? "utilisateur@example.com";
      });
    } else {
      print('Token non valide ou expiré');
      // Redirection vers la page de connexion
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()), // Remplacez par votre page de connexion
      );
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Supprimer toutes les données de préférence

    // Rediriger vers la page de connexion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()), // Remplacez par votre page de connexion
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Illustration.png'),
              ),
              const SizedBox(height: 16),
              Text(
                nom,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sub,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const Divider(),
              OptionItem(
                icon: Icons.badge_outlined,
                text: "Informations",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InformationPerso(),
                    ),
                  );
                },
              ),
              const Divider(),
              OptionItem(
                icon: Icons.password,
                text: "Changer Mot de Passe",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPassword(),
                    ),
                  );
                },
              ),
              const Divider(),
              OptionItem(
                icon: Icons.info_outline,
                text: "À Propos",
                onTap: () {
                  // Action pour À Propos
                },
              ),
              const Divider(),
              const SizedBox(height: 5),
              Mybutton(
                text: "Déconnexion",
                onTap: _logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const OptionItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, size: 30, color: Colors.black),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}