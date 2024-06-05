// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  final int id;
  final String phoneUser;
  final String NomUser;
  final String age;
  final String email;
  final String sexe;
  final String niveauSColaire;
  final String SituationMatrimoniale;
  final String emploi;

  Users({
    required this.id,
    required this.phoneUser,
    required this.NomUser,
    required this.age,
    required this.email,
    required this.sexe,
    required this.niveauSColaire,
    required this.SituationMatrimoniale,
    required this.emploi,
  });

  Users.fromJson(Map<String, Object?> json)
      : this(
          id: json['id'] as int,
          phoneUser: json['phoneUser']! as String,
          NomUser: json['NomUser']! as String,
          age: json['age']! as String, // Pas d'espace à la fin de 'age'
          email: json['email']! as String,
          sexe: json['sexe']! as String,
          niveauSColaire: json['niveauScolaire']! as String,
          SituationMatrimoniale: json['SituationMatrimoniale']! as String,
          emploi: json['emploi']! as String,
        );

  Users copywith(
      {int? id,
      String? phoneUser,
      String? age,
      String? email,
      String? sexe,
      String? niveauSColaire,
      String? SituationMatrimoniale,
      String? emploi}) {
    return Users(
        id: id ?? this.id,
        phoneUser: phoneUser ?? this.phoneUser,
        NomUser: NomUser ?? this.NomUser,
        age: age ?? this.age,
        email: email ?? this.email,
        sexe: sexe ?? this.sexe,
        niveauSColaire: niveauSColaire ?? this.niveauSColaire,
        SituationMatrimoniale:
            SituationMatrimoniale ?? this.SituationMatrimoniale,
        emploi: emploi ?? this.emploi);

  }
    Map<String, Object?> toJson() {
      return {
        'id': id,
        'phoneUser': phoneUser,
        'NomUser': NomUser,
        'age': age,
        'email': email,
        'sexe': sexe,
        'niveauScolaire': niveauSColaire,
        'SituationMatrimoniale': SituationMatrimoniale,
        'emploi': emploi
      };
    }
}
