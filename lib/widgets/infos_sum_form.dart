import 'package:auth_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoSummuryForm extends StatefulWidget {
  @override
  State<InfoSummuryForm> createState() => _InfoSummuryFormState();
}

class _InfoSummuryFormState extends State<InfoSummuryForm> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();

    _loadUserData();
  }

 

  Future<void> _loadUserData() async {
    final userData = await AuthService.getUserByUid();
    setState(() {
      _userData = userData;
      print('user data suite');
      print(_userData);
    });
  }

  int count = 0;
  String? numero;
  String? nom;
  String? age;
  String? email;
  String? sexe;
  String? niveau;
  String? situation;
  String? emploi;

  void methodSynchronisation() async {
    count++;

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('phoneUser', _phoneController.text);
    await prefs.setString('NomUser', _nomComplet.text);
    await prefs.setString('age', _age.text);
    await prefs.setString('email', _email.text);
    await prefs.setString('sexe', _sexe.text);
    await prefs.setString('niveauSColaire', _niveauScolaire.text);
    await prefs.setString('SituationMatrimoniale', _situationMatrimoniale.text);
    await prefs.setString('emploi', _emploi.text);

    numero = prefs.getString('phoneUser') ?? '';
    nom = prefs.getString('NomUser') ?? '';
    age = prefs.getString('age') ?? '';
    email = prefs.getString('email') ?? '';
    sexe = prefs.getString('sexe') ?? '';
    niveau = prefs.getString('niveauSColaire') ?? '';
    situation = prefs.getString('SituationMatrimoniale') ?? '';
    emploi = prefs.getString('emploi') ?? '';

    print('nous omme la ');
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nomComplet = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _sexe = TextEditingController();
  final TextEditingController _niveauScolaire = TextEditingController();
  final TextEditingController _situationMatrimoniale = TextEditingController();
  final TextEditingController _emploi = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthService.getUserByUid();

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: count == 1
          ? Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Mon profile',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Voici vos informations ',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.call),
                          hintText: '${numero}',
                          helperText: 'Numéro de téléphone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _nomComplet,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${nom}',
                          helperText: 'Nom complet',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _age,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${age}',
                          helperText: 'Age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.email),
                          hintText: 'ca marche bro',
                          helperText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _sexe,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${sexe}',
                          helperText: 'Sexe',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _niveauScolaire,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.school),
                          hintText: '${niveau}',
                          helperText: 'Niveau scolaire',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _situationMatrimoniale,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${situation}',
                          helperText: 'Situation matrimoniale',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _emploi,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.work),
                          hintText: '${emploi}',
                          helperText: 'Emploi',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                // Form is valid, proceed with update
                                AuthService.updateUserData(
                                  phoneUser: _phoneController.text,
                                  NomUser: _nomComplet.text.isEmpty
                                      ? _userData!['NomUser']
                                      : _nomComplet.text,
                                  age: _age.text.isEmpty
                                      ? _userData!['age']
                                      : _age.text,
                                  email: _email.text.isEmpty
                                      ? _userData!['email']
                                      : _email.text,
                                  sexe: _sexe.text.isEmpty
                                      ? _userData!['sexe']
                                      : _sexe.text,
                                  niveauSColaire: _niveauScolaire.text.isEmpty
                                      ? _userData!['niveauSColaire']
                                      : _niveauScolaire.text,
                                  SituationMatrimoniale:
                                      _situationMatrimoniale.text.isEmpty
                                          ? _userData!['SituationMatrimoniale']
                                          : _situationMatrimoniale.text,
                                  emploi: _emploi.text.isEmpty
                                      ? _userData!['emploi']
                                      : _emploi.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              child: Text(
                                'Modifier',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                methodSynchronisation();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              child: Text(
                                'Synchroniser',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Mon profile',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Voici vos informations ',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.call),
                          hintText: '${_userData!['phoneUser']}',
                          helperText: 'Numéro de téléphone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _nomComplet,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${_userData!['NomUser']}',
                          helperText: 'Nom complet',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _age,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${_userData!['age']}',
                          helperText: 'Age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.email),
                          hintText: '${_userData!['email']}',
                          helperText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _sexe,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${_userData!['sexe']}',
                          helperText: 'Sexe',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _niveauScolaire,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.school),
                          hintText: '${_userData!['niveauSColaire']}',
                          helperText: 'Niveau scolaire',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _situationMatrimoniale,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.person),
                          hintText: '${_userData!['SituationMatrimoniale']}',
                          helperText: 'Situation matrimoniale',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    child: TextFormField(
                      controller: _emploi,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          prefixIcon: Icon(Icons.work),
                          hintText: '${_userData!['emploi']}',
                          helperText: 'Emploi',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                // Form is valid, proceed with update
                                AuthService.updateUserData(
                                  phoneUser: _phoneController.text,
                                  NomUser: _nomComplet.text.isEmpty
                                      ? _userData!['NomUser']
                                      : _nomComplet.text,
                                  age: _age.text.isEmpty
                                      ? _userData!['age']
                                      : _age.text,
                                  email: _email.text.isEmpty
                                      ? _userData!['email']
                                      : _email.text,
                                  sexe: _sexe.text.isEmpty
                                      ? _userData!['sexe']
                                      : _sexe.text,
                                  niveauSColaire: _niveauScolaire.text.isEmpty
                                      ? _userData!['niveauSColaire']
                                      : _niveauScolaire.text,
                                  SituationMatrimoniale:
                                      _situationMatrimoniale.text.isEmpty
                                          ? _userData!['SituationMatrimoniale']
                                          : _situationMatrimoniale.text,
                                  emploi: _emploi.text.isEmpty
                                      ? _userData!['emploi']
                                      : _emploi.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              child: Text(
                                'Modifier',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                methodSynchronisation();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              child: Text(
                                'Synchroniser',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    )));
  }
}
