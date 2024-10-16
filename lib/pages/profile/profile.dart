import 'package:flutter/material.dart';
import 'package:odc_formation/pages/auth/NewPassword.dart';
import 'package:odc_formation/pages/profile/information.dart';
import 'package:odc_formation/pages/profile/notifications.dart';
import 'package:odc_formation/pages/widget/Button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: const IconThemeData(color:Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar et informations utilisateur
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Illustration.png'), // Remplacez par votre propre image
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Madou KONE",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                "madou@gmail.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Liste des options
              OptionItem(
                icon: Icons.lightbulb_outline,
                text: "Compétences",
                onTap: () {
                  // Action pour Compétences
                },
              ),
              const Divider(),
              OptionItem(
                icon: Icons.badge_outlined,
                text: "Information's",
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const InformationPerso()
                  )
                  );
                },
              ),
              const Divider(),
              OptionItem(
                icon: Icons.notifications_outlined,
                text: "Notifications",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>  const Notifications()
                      )
                  );
                },
              ),
              const Divider(),
              OptionItem(
                icon: Icons.password,
                text: "Change Mot de Passe",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewPassword())
                  );
                },
              ),
              const Divider(),
              OptionItem(
                icon: Icons.info_outline,
                text: "A Propos",
                onTap: () {
                  // Action pour A Propos
                },
              ),
              const Divider(),
              const SizedBox(height:5),
              // Bouton de déconnexion
             Mybutton(onTab: (){}, text: "Déconnexion")
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
          style: TextStyle(fontSize: 18),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}
