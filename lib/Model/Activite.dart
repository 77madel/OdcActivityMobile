import 'Etape.dart';

class Activite {
  final int id;
  final String nom;
  final String titre;
  final String dateDebut;
  final String dateFin;
  final String lieu;
  final String description;
  final int objectifParticipation;
  final Etape etape;

  Activite({
    required this.id,
    required this.nom,
    required this.titre,
    required this.dateDebut,
    required this.dateFin,
    required this.lieu,
    required this.description,
    required this.objectifParticipation,
    required this.etape,
  });

  factory Activite.fromJson(Map<String, dynamic> json) {
    // Vérifiez que l'étape n'est pas nulle
    var etapeJson = json['etape'];
    if (etapeJson == null) {
      throw Exception('Étape manquante dans le JSON');
    }

    return Activite(
      id: json['id'] as int,
      nom: json['nom'] as String? ?? 'Nom inconnu',
      titre: json['titre'] as String? ?? 'Titre inconnu',
      dateDebut: json['dateDebut'] as String? ?? 'Date inconnue',
      dateFin: json['dateFin'] as String? ?? 'Date inconnue',
      lieu: json['lieu'] as String? ?? 'Lieu inconnu',
      description: json['description'] as String? ?? 'Aucune description',
      objectifParticipation: json['objectifParticipation'] as int? ?? 0,
      etape: Etape.fromJson(etapeJson),
    );
  }
}