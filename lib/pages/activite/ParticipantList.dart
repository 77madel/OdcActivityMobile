import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Model/Activite.dart';
import '../../Model/Participant.dart';
import 'package:odc_formation/pages/widget/Button.dart';

class ParticipantsListScreen extends StatefulWidget {
  final Activite activite;

  const ParticipantsListScreen({required this.activite, Key? key}) : super(key: key);

  @override
  _ParticipantsListScreenState createState() => _ParticipantsListScreenState();
}

class _ParticipantsListScreenState extends State<ParticipantsListScreen> {
  late List<Participant> participants;
  late List<Participant> filteredParticipants; // Liste filtrée des participants
  String searchQuery = ""; // Requête de recherche

  @override
  void initState() {
    super.initState();
    // Initialisez la liste des participants à partir de l'étape de l'activité
    participants = widget.activite.etape.listeDebut;
    filteredParticipants = participants; // Initialiser avec tous les participants
  }

  Future<Participant?> checkInParticipant(int id) async {
    final url = Uri.parse('http://localhost:8080/participant/check-in/$id');
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        return Participant.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to check in participant');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  void _onValidate() async {
    final selectedParticipants = participants.where((p) => p.checkedIn).toList();
    for (var participant in selectedParticipants) {
      final checkedInParticipant = await checkInParticipant(participant.id);
      if (checkedInParticipant != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${checkedInParticipant.nom} a été check-in')),
        );
        setState(() {
          participant.checkedIn = true; // Marquer comme check-in
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors du check-in pour ${participant.nom}')),
        );
      }
    }
  }

  void _filterParticipants(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredParticipants = participants.where((participant) {
        return participant.nom.toLowerCase().contains(searchQuery) ||
            participant.prenom!.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.orange),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Liste des participants - ${widget.activite.nom}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: _filterParticipants, // Mettre à jour le filtrage
                decoration: InputDecoration(
                  hintText: 'Recherche participants',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.search, color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredParticipants.length, // Utiliser la liste filtrée
                itemBuilder: (context, index) {
                  return ParticipantCard(
                    participant: filteredParticipants[index],
                    onChanged: (bool? value) {
                      if (!filteredParticipants[index].checkedIn) {
                        setState(() {
                          filteredParticipants[index].checkedIn = value ?? false; // Mettre à jour le statut
                        });
                      }
                    },
                    isEnabled: !filteredParticipants[index].checkedIn, // Désactiver si check-in
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Mybutton(text: "Valider", onTap: _onValidate),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ParticipantCard extends StatelessWidget {
  final Participant participant;
  final ValueChanged<bool?> onChanged;
  final bool isEnabled;

  const ParticipantCard({
    required this.participant,
    required this.onChanged,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${participant.nom} ${participant.prenom}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(height: 4),
                Text('Téléphone: ${participant.phone}'),
              ],
            ),
          ),
          Checkbox(
            value: participant.checkedIn,
            onChanged: isEnabled ? onChanged : null,
            activeColor: Colors.orange,
            checkColor: Colors.white,
          ),
        ],
      ),
    );
  }
}