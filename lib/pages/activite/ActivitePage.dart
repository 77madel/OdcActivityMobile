import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odc_formation/pages/profile/profile.dart';

import '../../Model/Activite.dart';
import 'ParticipantList.dart';

class ActivityListScreen extends StatefulWidget {
  const ActivityListScreen({super.key});

  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  Future<List<Activite>>? _futureActivites;
  String searchQuery = ""; // Pour stocker la requête de recherche

  @override
  void initState() {
    super.initState();
    _futureActivites = fetchActivities(); // Récupérer les activités lors de l'initialisation
  }

  // Méthode pour récupérer les activités depuis l'API
  Future<List<Activite>> fetchActivities() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/activite/enCours'),
      ).timeout(const Duration(seconds: 100));

      if (response.statusCode == 200) {
        final List<dynamic> activitiesList = json.decode(response.body);
        return activitiesList.map((json) => Activite.fromJson(json)).toList();
      } else {
        throw Exception('Échec du chargement des activités. Code : ${response.statusCode}');
      }
    } catch (e) {
      if (e is TimeoutException) {
        print('Erreur : La requête a expiré. Vérifiez le serveur.');
      } else {
        print('Erreur réseau : $e');
      }
      return []; // Retourner une liste vide en cas d'erreur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase(); // Mettre à jour la requête de recherche
            });
          },
          decoration: const InputDecoration(
            hintText: 'Recherche une Activite',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.orange),
          ),
        ),
      ),
      body: FutureBuilder<List<Activite>>(
        future: _futureActivites,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucune activité trouvée.'));
          }

          final activities = snapshot.data!.where((activite) {
            return activite.nom.toLowerCase().contains(searchQuery);
          }).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return ActivityCard(activite: activities[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action à réaliser lors de l'appui sur le bouton flottant
          // Par exemple, vous pouvez naviguer vers un nouvel écran pour ajouter une activité
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(), // Remplacez par votre écran d'ajout d'activité
            ),
          );
        },
        child: const Icon(Icons.person,color: Colors.white), // Icône du bouton flottant
        backgroundColor: Colors.orange, // Couleur de fond du bouton
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activite activite;

  const ActivityCard({super.key, required this.activite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ParticipantsListScreen(activite: activite),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Illustration.png',
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.image, size: 80, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Text(
                activite.nom,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
