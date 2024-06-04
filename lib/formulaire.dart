import 'package:auth_test/acceuil.dart';
import 'package:auth_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReadSms()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Formulaire()));
      }
    } );
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

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
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        labelText: 'Âge',
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        labelText: 'Email',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                        labelText: 'Sexe',
                        prefixIcon: Icons.person,
                        items: const [
                          DropdownMenuItem(
                              value: "Homme", child: Text("Homme")),
                          DropdownMenuItem(
                              value: "Femme", child: Text("Femme")),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                        labelText: 'Niveau scolaire',
                        prefixIcon: Icons.school,
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
                      ),
                      const SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                        labelText: 'Situation Matrimoniale',
                        prefixIcon: Icons.person,
                        items: const [
                          DropdownMenuItem(
                              value: "Célibataire", child: Text("Célibataire")),
                          DropdownMenuItem(
                              value: "En couple", child: Text("En couple")),
                          DropdownMenuItem(
                              value: "Veuf ou veuve",
                              child: Text("Veuf ou veuve")),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildDropdownButtonFormField(
                        labelText: 'Emploi',
                        prefixIcon: Icons.work,
                        items: const [
                          DropdownMenuItem(
                              value: "Au chômage", child: Text("Au chômage")),
                          DropdownMenuItem(
                              value: "A un emploi", child: Text("A un emploi")),
                        ],
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
                                            keyboardType: TextInputType.number,
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
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Colors.red,
                                                      Colors.orange
                                                    ])),
                                            child: MaterialButton(
                                              onPressed: () {
                                                AuthService.loginWithOtp(
                                                        otp:
                                                            _otpController.text)
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
                                                        .showSnackBar(SnackBar(
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
                                },
                              );
                            } else {
                              print("Le formulaire n'est pas valide.");
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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 210, 210, 210)),
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildDropdownButtonFormField({
    required String labelText,
    required IconData prefixIcon,
    required List<DropdownMenuItem<String>> items,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        filled: true,
        fillColor: const Color.fromARGB(255, 242, 242, 242),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 210, 210, 210)),
        ),
      ),
      items: items,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
