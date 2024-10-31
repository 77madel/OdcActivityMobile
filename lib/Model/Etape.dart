import 'Participant.dart';

class Etape {
  final int id;
  final String nom;
  final String statut; // Assurez-vous d'ajouter le champ statut ici
  final List<Participant> listeDebut;

  Etape({
    required this.id,
    required this.nom,
    required this.statut, // Incluez le statut dans le constructeur
    required this.listeDebut,
  });

  factory Etape.fromJson(Map<String, dynamic> json) {
    var list = json['listeDebut'] as List;
    List<Participant> participantsList = list.map((i) => Participant.fromJson(i)).toList();

    return Etape(
      id: json['id'],
      nom: json['nom'] as String? ?? 'Nom de l’étape inconnu',
      statut: json['statut'] as String? ?? 'Statut inconnu', // Vérifiez que le statut n'est pas nul
      listeDebut: participantsList,
    );
  }
}