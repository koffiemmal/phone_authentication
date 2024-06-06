import 'dart:math';

import 'package:auth_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    print(count);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    count = prefs.getInt('counter') ?? 0;

    count++;

    await prefs.setInt('counter', count);

    //await prefs.setString('phoneUser', _phoneController.text);

    numero = prefs.getString('phoneUser') ?? '${_userData!['phoneUser']}';

    nom = prefs.getString('nomUser') ?? '${_userData!['NomUser']}';

    age = prefs.getString('age') ?? '${_userData!['age']}';

    email = prefs.getString('email') ?? '${_userData!['email']}';

    sexe = prefs.getString('sexe') ?? '${_userData!['sexe']}';

    niveau =
        prefs.getString('niveauSColaire') ?? '${_userData!['niveauSColaire']}';

    situation = prefs.getString('SituationMatrimoniale') ??
        '${_userData!['SituationMatrimoniale']}';

    emploi = prefs.getString('emploi') ?? '${_userData!['emploi']}';

    await prefs.setString('NomUser', '${_userData!['NomUser']}');

    await prefs.setString('phoneUser', '${_userData!['phoneUser']}');

    await prefs.setString('age', '${_userData!['age']}');

    await prefs.setString('email', '${_userData!['email']}');

    await prefs.setString('sexe', '${_userData!['sexe']}');

    await prefs.setString('niveauSColaire', '${_userData!['niveauSColaire']}');
    //

    await prefs.setString(
        'SituationMatrimoniale', '${_userData!['SituationMatrimoniale']}');

    await prefs.setString('emploi', '${_userData!['emploi']}');

    // print('${_userData!['NomUser']}');
    print(numero);
    print(nom);
    print(age);
    print(email);
    print(sexe);
    print(situation);
    print(niveau);
    print(emploi);
  }

  final String accountSid = 'AC31b12c648bb7c441d780fa0a32c44340';
  final String authToken = 'e04e3e172aef561cb0056aa62b9caf6b';
  final String twilioNumber = '+14178052052';

  Future<void> _sendSms(String toNumber, String messageBody) async {
    final String url =
        'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization':
            'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'To': '+228$toNumber',
        'From': twilioNumber,
        'Body': messageBody,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('SMS sent successfully');
    } else {
      print('Failed to send SMS: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  String? _generatedCode;

  String generateRandomCode() {
    var random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  void _sendVerificationCode() {
    String phoneNumber = '${_userData!['phoneUser']}';
    _generatedCode = generateRandomCode();
    _sendSms(phoneNumber, 'Votre code de vérification est: $_generatedCode');
  }

  bool _verifyCode() {
    if (_codeController.text == _generatedCode) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Code vérifié avec succès!')));
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Code incorrect.')));
      return false;
    }
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nomComplet = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _sexe = TextEditingController();
  final TextEditingController _niveauScolaire = TextEditingController();
  final TextEditingController _situationMatrimoniale = TextEditingController();
  final TextEditingController _emploi = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthService.getUserByUid();

    return SafeArea(
        child: Scaffold(
            body: _userData == null
                ? Expanded(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: count != 0
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
                                        hintText: '$numero',
                                        helperText: 'Numéro de téléphone',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _nomComplet,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '$nom',
                                        helperText: 'Nom complet',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _age,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '$age',
                                        helperText: 'Age',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.email),
                                        hintText: '$email',
                                        helperText: 'Email',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _sexe,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '$sexe',
                                        helperText: 'Sexe',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _niveauScolaire,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.school),
                                        hintText: '$niveau',
                                        helperText: 'Niveau scolaire',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _situationMatrimoniale,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '$situation',
                                        helperText: 'Situation matrimoniale',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _emploi,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.work),
                                        hintText: '$emploi',
                                        helperText: 'Emploi',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              _sendVerificationCode();
                                              // Form is valid, proceed with update
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text(
                                                      'Vérification du code'),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                          "Entrer les 6 chiffres"),
                                                      const SizedBox(height: 8),
                                                      TextFormField(
                                                        controller:
                                                            _codeController,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: 'OTP',
                                                          prefixIcon:
                                                              Icon(Icons.lock),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
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
                                                                BorderRadius.circular(
                                                                    25),
                                                            gradient: LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                                colors: [
                                                                  Colors.red,
                                                                  Colors.orange
                                                                ])),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            bool valeur =
                                                                _verifyCode();

                                                            if (valeur ==
                                                                true) {
                                                              final phoneUser =
                                                                  _phoneController
                                                                          .text
                                                                          .isEmpty
                                                                      ? _userData![
                                                                          'phoneUser']
                                                                      : _phoneController
                                                                          .text;
                                                              final nomUser = _nomComplet
                                                                      .text
                                                                      .isEmpty
                                                                  ? _userData![
                                                                      'NomUser']
                                                                  : _nomComplet
                                                                      .text;
                                                              final age = _age
                                                                      .text
                                                                      .isEmpty
                                                                  ? _userData![
                                                                      'age']
                                                                  : _age.text;
                                                              final email = _email
                                                                      .text
                                                                      .isEmpty
                                                                  ? _userData![
                                                                      'email']
                                                                  : _email.text;
                                                              final sexe = _sexe
                                                                      .text
                                                                      .isEmpty
                                                                  ? _userData![
                                                                      'sexe']
                                                                  : _sexe.text;
                                                              final niveauScolaire =
                                                                  _niveauScolaire
                                                                          .text
                                                                          .isEmpty
                                                                      ? _userData![
                                                                          'niveauSColaire']
                                                                      : _niveauScolaire
                                                                          .text;
                                                              final situationMatrimoniale =
                                                                  _situationMatrimoniale
                                                                          .text
                                                                          .isEmpty
                                                                      ? _userData![
                                                                          'SituationMatrimoniale']
                                                                      : _situationMatrimoniale
                                                                          .text;
                                                              final emploi = _emploi
                                                                      .text
                                                                      .isEmpty
                                                                  ? _userData![
                                                                      'emploi']
                                                                  : _emploi
                                                                      .text;
                                                              String docId =
                                                                  _userData?[
                                                                          'docId'] ??
                                                                      '';
                                                              // Form is valid, proceed with update
                                                              AuthService
                                                                  .updateUserData(
                                                                docId: docId,
                                                                phoneUser:
                                                                    phoneUser,
                                                                NomUser:
                                                                    nomUser,
                                                                age: age,
                                                                email: email,
                                                                sexe: sexe,
                                                                niveauSColaire:
                                                                    niveauScolaire,
                                                                SituationMatrimoniale:
                                                                    situationMatrimoniale,
                                                                emploi: emploi,
                                                              );
                                                            }
                                                          },
                                                          child: Text(
                                                            "Valider",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange),
                                            child: Text(
                                              'Modifier',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ),
                                      Container(
                                        height: 60,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              methodSynchronisation();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange),
                                            child: Text(
                                              'Synchroniser',
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _nomComplet,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '${_userData!['NomUser']}',
                                        helperText: 'Nom complet',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _age,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '${_userData!['age']}',
                                        helperText: 'Age',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.email),
                                        hintText: '${_userData!['email']}',
                                        helperText: 'Email',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _sexe,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText: '${_userData!['sexe']}',
                                        helperText: 'Sexe',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _niveauScolaire,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.school),
                                        hintText:
                                            '${_userData!['niveauSColaire']}',
                                        helperText: 'Niveau scolaire',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _situationMatrimoniale,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.person),
                                        hintText:
                                            '${_userData!['SituationMatrimoniale']}',
                                        helperText: 'Situation matrimoniale',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 15),
                                  child: TextFormField(
                                    controller: _emploi,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        prefixIcon: Icon(Icons.work),
                                        hintText: '${_userData!['emploi']}',
                                        helperText: 'Emploi',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              _sendVerificationCode();
                                              // Form is valid, proceed with update
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text(
                                                      'Vérification du code'),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                          "Entrer les 6 chiffres"),
                                                      const SizedBox(height: 8),
                                                      TextFormField(
                                                        controller:
                                                            _codeController,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: 'OTP',
                                                          prefixIcon:
                                                              Icon(Icons.lock),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
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
                                                                BorderRadius.circular(
                                                                    25),
                                                            gradient: LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                                colors: [
                                                                  Colors.red,
                                                                  Colors.orange
                                                                ])),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            _verifyCode();
                                                            final phoneUser =
                                                                _phoneController
                                                                        .text
                                                                        .isEmpty
                                                                    ? _userData![
                                                                        'phoneUser']
                                                                    : _phoneController
                                                                        .text;
                                                            final nomUser =
                                                                _nomComplet.text
                                                                        .isEmpty
                                                                    ? _userData![
                                                                        'NomUser']
                                                                    : _nomComplet
                                                                        .text;
                                                            final age = _age
                                                                    .text
                                                                    .isEmpty
                                                                ? _userData![
                                                                    'age']
                                                                : _age.text;
                                                            final email = _email
                                                                    .text
                                                                    .isEmpty
                                                                ? _userData![
                                                                    'email']
                                                                : _email.text;
                                                            final sexe = _sexe
                                                                    .text
                                                                    .isEmpty
                                                                ? _userData![
                                                                    'sexe']
                                                                : _sexe.text;
                                                            final niveauScolaire =
                                                                _niveauScolaire
                                                                        .text
                                                                        .isEmpty
                                                                    ? _userData![
                                                                        'niveauSColaire']
                                                                    : _niveauScolaire
                                                                        .text;
                                                            final situationMatrimoniale =
                                                                _situationMatrimoniale
                                                                        .text
                                                                        .isEmpty
                                                                    ? _userData![
                                                                        'SituationMatrimoniale']
                                                                    : _situationMatrimoniale
                                                                        .text;
                                                            final emploi = _emploi
                                                                    .text
                                                                    .isEmpty
                                                                ? _userData![
                                                                    'emploi']
                                                                : _emploi.text;
                                                            String docId =
                                                                _userData?[
                                                                        'docId'] ??
                                                                    '';

                                                            // Form is valid, proceed with update
                                                            AuthService
                                                                .updateUserData(
                                                              docId: docId,
                                                              phoneUser:
                                                                  phoneUser,
                                                              NomUser: nomUser,
                                                              age: age,
                                                              email: email,
                                                              sexe: sexe,
                                                              niveauSColaire:
                                                                  niveauScolaire,
                                                              SituationMatrimoniale:
                                                                  situationMatrimoniale,
                                                              emploi: emploi,
                                                            );
                                                          },
                                                          child: Text(
                                                            "Valider",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange),
                                            child: Text(
                                              'Modifier',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ),
                                      Container(
                                        height: 60,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              methodSynchronisation();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange),
                                            child: Text(
                                              'Synchroniser',
                                              style: TextStyle(
                                                  color: Colors.black),
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
/**
 * ElevatedButton(
                                            onPressed: () {
                                              // Form is valid, proceed with update
                                              AuthService.updateUserData(
                                                phoneUser:
                                                    _phoneController.text,
                                                NomUser:
                                                    _nomComplet.text.isEmpty
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
                                                niveauSColaire:
                                                    _niveauScolaire.text.isEmpty
                                                        ? _userData![
                                                            'niveauSColaire']
                                                        : _niveauScolaire.text,
                                                SituationMatrimoniale:
                                                    _situationMatrimoniale
                                                            .text.isEmpty
                                                        ? _userData![
                                                            'SituationMatrimoniale']
                                                        : _situationMatrimoniale
                                                            .text,
                                                emploi: _emploi.text.isEmpty
                                                    ? _userData!['emploi']
                                                    : _emploi.text,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange),
                                            child: Text(
                                              'Modifier',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))
 */