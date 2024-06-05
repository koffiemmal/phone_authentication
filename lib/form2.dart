// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auth_test/models/user_models.dart';

import 'package:auth_test/widgets/infos_sum_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:auth_test/services/auth_service.dart';

class Formulaire2 extends StatefulWidget {
  const Formulaire2({super.key});

  @override
  State<Formulaire2> createState() => _Formulaire2State();
}

class _Formulaire2State extends State<Formulaire2> {
  Future<void> navigate() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final user = await _firebaseAuth.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => InfoSummuryForm()));
    }
  }

  bool circul = false;
  @override
  void initState() {
    navigate();
    // TODO: implement initState
    super.initState();
  }


  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

  final TextEditingController _nomComplet = TextEditingController();

  final TextEditingController _age = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _sexe = TextEditingController();

  final TextEditingController _niveauScolaire = TextEditingController();

  final TextEditingController _situationMatrimoniale = TextEditingController();

  final TextEditingController _emploi = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Créer un nouveau \ncompte',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Veuillez remplir ce formulaire',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextFormField(
                        controller: _phoneController,
                        labelText: 'Numéro de téléphone',
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Téléphone invalide";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                          labelText: 'Nom complet',
                          controller: _nomComplet,
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 15) {
                              return "nom complet ";
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                          labelText: 'Âge',
                          controller: _age,
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "age invalide";
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                          labelText: 'Email',
                          prefixIcon: Icons.email,
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) {
                              return "Email invalide";
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "sexe",
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 242, 242, 242),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 210, 210, 210)),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: "Homme", child: Text("Homme")),
                          DropdownMenuItem(
                              value: "Femme", child: Text("Femme")),
                        ],
                        onChanged: (value) {
                          print(value);
                          _sexe.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'choisir une option';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Niveau scolaire',
                          prefixIcon: Icon(Icons.school),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 242, 242, 242),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 210, 210, 210)),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: "Bac 1", child: Text("Bac 1")),
                          DropdownMenuItem(
                              value: "Bac 2", child: Text("Bac 2")),
                          DropdownMenuItem(value: "Bts", child: Text("Bts")),
                          DropdownMenuItem(
                              value: "Licence", child: Text("Licence")),
                          DropdownMenuItem(
                              value: "Master 1", child: Text("Master 1")),
                          DropdownMenuItem(
                              value: "Master 2", child: Text("Master 2")),
                          DropdownMenuItem(
                              value: "Doctorat", child: Text("Doctorat")),
                          DropdownMenuItem(
                              value: "Autre", child: Text("Autre")),
                        ],
                        onChanged: (value) {
                          print(value);
                          _niveauScolaire.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'choisir une option';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Situation Matrimoniale',
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 242, 242, 242),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 210, 210, 210)),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: "Célibataire", child: Text("Célibataire")),
                          DropdownMenuItem(
                              value: "En couple", child: Text("En couple")),
                          DropdownMenuItem(
                              value: "Veuf ou veuve",
                              child: Text("Veuf ou veuve")),
                        ],
                        onChanged: (value) {
                          print(value);
                          _situationMatrimoniale.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'choisir une option';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Emploi',
                          prefixIcon: Icon(Icons.work),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 242, 242, 242),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 210, 210, 210)),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: "Ouvrier", child: Text("Ouvrier")),
                          DropdownMenuItem(
                              value: "Employé de bureau",
                              child: Text("Employé de bureau")),
                          DropdownMenuItem(
                              value: "Technicien", child: Text("Technicien")),
                          DropdownMenuItem(
                              value: "Cadre", child: Text("Cadre")),
                          DropdownMenuItem(
                              value: "Ingénieur", child: Text("Ingénieur")),
                          DropdownMenuItem(
                              value: "Médecin", child: Text("Médecin")),
                          DropdownMenuItem(
                              value: "Avocat", child: Text("Avocat")),
                          DropdownMenuItem(
                              value: "Comptable", child: Text("Comptable")),
                          DropdownMenuItem(
                              value: "Professeur", child: Text("Professeur")),
                          DropdownMenuItem(
                              value: "Artisan", child: Text("Artisan")),
                          DropdownMenuItem(
                              value: "Commerçant", child: Text("Commerçant")),
                          DropdownMenuItem(
                              value: "Agriculteur", child: Text("Agriculteur")),
                          DropdownMenuItem(
                              value: "Chef d'entreprise",
                              child: Text("Chef d'entreprise")),
                          DropdownMenuItem(
                              value: "Fonctionnaire",
                              child: Text("Fonctionnaire")),
                          DropdownMenuItem(
                              value: "Étudiant", child: Text("Étudiant")),
                          DropdownMenuItem(
                              value: "Retraité", child: Text("Retraité")),
                          DropdownMenuItem(
                              value: "Chômeur", child: Text("Chômeur")),
                          DropdownMenuItem(
                              value: "Indépendant", child: Text("Indépendant")),
                          DropdownMenuItem(
                              value: "Freelance", child: Text("Freelance")),
                          DropdownMenuItem(
                              value: "Consultant", child: Text("Consultant")),
                          DropdownMenuItem(
                              value: "Infirmier", child: Text("Infirmier")),
                          DropdownMenuItem(
                              value: "Assistante sociale",
                              child: Text("Assistante sociale")),
                          DropdownMenuItem(
                              value: "Informaticien",
                              child: Text("Informaticien")),
                          DropdownMenuItem(
                              value: "Architecte", child: Text("Architecte")),
                          DropdownMenuItem(
                              value: "Journaliste", child: Text("Journaliste")),
                          DropdownMenuItem(
                              value: "Artiste", child: Text("Artiste")),
                        ],
                        onChanged: (value) {
                          print(value);
                          _emploi.text = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'choisir une option';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.red, Colors.orange],
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              circul = true;
                            });

                            if (_formKey.currentState!.validate()) {
                              print(
                                  "Le formulaire est valide. Envoi de l'OTP...");

                              AuthService.sentOtp(
                                  phone: _phoneController.text,
                                  errorStep: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Erreur lors de l'envoi de l'OTP"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                  nextStep: () {
                                    print(
                                        "OTP envoyé. Affichage de la boîte de dialogue...");
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Vérification OTP'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text("Entrer les 6 chiffres"),
                                            const SizedBox(height: 8),
                                            TextFormField(
                                              controller: _otpController,
                                              decoration: const InputDecoration(
                                                labelText: 'OTP',
                                                prefixIcon: Icon(Icons.lock),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    6),
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Colors.red,
                                                        Colors.orange
                                                      ])),
                                              child: MaterialButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Formulaire2()));
                                                  AuthService.loginWithOtp(
                                                          otp: _otpController
                                                              .text)
                                                      .then((value) {
                                                    print("otp zone");
                                                    ;
                                                    AuthService.registerUser(
                                                        phoneUser:
                                                            _phoneController
                                                                .text,
                                                        NomUser:
                                                            _nomComplet.text,
                                                        age: _age.text,
                                                        email: _email.text,
                                                        sexe: _sexe.text,
                                                        niveauSColaire:
                                                            _niveauScolaire
                                                                .text,
                                                        SituationMatrimoniale:
                                                            _situationMatrimoniale
                                                                .text,
                                                        emploi: _emploi.text);

                                                    /*            Users users = Users(
                                                        id: 15,
                                                        phoneUser:
                                                            _phoneController
                                                                .text,
                                                        NomUser:
                                                            _nomComplet.text,
                                                        age: _age.text,
                                                        email: _email.text,
                                                        sexe: _sexe.text,
                                                        niveauSColaire:
                                                            _niveauScolaire
                                                                .text,
                                                        SituationMatrimoniale:
                                                            _situationMatrimoniale
                                                                .text,
                                                        emploi: _emploi.text);
                                                    _databaseService
                                                        .addUsers(users); */
                                                    if (value == "Success") {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  InfoSummuryForm()));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content: Text(
                                                            "Erreur de l'envoi de l'OTP"),
                                                        backgroundColor:
                                                            Colors.red,
                                                      ));
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  "Valider",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          child: circul == true
                              ? CircularProgressIndicator()
                              : const Text(
                                  "S'enregistrer",
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    TextEditingController? controller,
    required String labelText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        filled: true,
        fillColor: const Color.fromARGB(255, 242, 242, 242),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 210, 210, 210)),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
