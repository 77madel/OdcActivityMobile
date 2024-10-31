class Participant {
  final int id;
  final String nom;
  final String? prenom;
  final String? email;
  final String? phone;
  final String? genre;
  bool checkedIn; // Ne pas utiliser 'late' ici, mais plutôt initialiser directement

  Participant({
    required this.id,
    required this.nom,
    this.prenom,
    this.email,
    this.phone,
    this.genre,
    this.checkedIn = false, // Valeur par défaut
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      phone: json['phone'],
      genre: json['genre'],
      checkedIn: json['checkedIn'] ?? false, // Assurez-vous de gérer les valeurs nulles
    );
  }
}