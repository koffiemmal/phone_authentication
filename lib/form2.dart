// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auth_test/acceuil.dart';
import 'package:auth_test/otp.dart';
import 'package:auth_test/services/auth_service.dart';

class Formulaire2 extends StatefulWidget {
  const Formulaire2({super.key});

  @override
  State<Formulaire2> createState() => _Formulaire2State();
}

class _Formulaire2State extends State<Formulaire2> {
  @override
  void initState() {
    ;
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
                              value: "Au chômage", child: Text("Au chômage")),
                          DropdownMenuItem(
                              value: "A un emploi", child: Text("A un emploi")),
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
                            if (_formKey.currentState!.validate()) {
                              print(
                                  "Le formulaire est valide. Envoi de l'OTP...");

                              Utilisateur newuser = Utilisateur(
                                  phoneUser: _phoneController.text,
                                  NomUser: _nomComplet.text,
                                  age: _age.text,
                                  email: _email.text,
                                  sexe: _sexe.text,
                                  niveauSColaire: _niveauScolaire.text,
                                  SituationMatrimoniale:
                                      _situationMatrimoniale.text,
                                  emploi: _emploi.text);

                              print(newuser.toString());
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
                                                    if (value == "Success") {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ReadSms()));
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
                          child: const Text(
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

class Utilisateur {
  final String phoneUser;

  final String NomUser;

  final String age;

  final String email;

  final String sexe;

  final String niveauSColaire;

  final String SituationMatrimoniale;

  final String emploi;
  Utilisateur({
    required this.phoneUser,
    required this.NomUser,
    required this.age,
    required this.email,
    required this.sexe,
    required this.niveauSColaire,
    required this.SituationMatrimoniale,
    required this.emploi,
  });

  @override
  String toString() {
    return 'Utilisateur(phoneUser: $phoneUser, NomUser: $NomUser, age: $age, email: $email, sexe: $sexe, niveauSColaire: $niveauSColaire, SituationMatrimoniale: $SituationMatrimoniale, emploi: $emploi)';
  }
}
