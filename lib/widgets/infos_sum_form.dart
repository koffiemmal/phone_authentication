import 'package:flutter/material.dart';

class InfoSummuryForm extends StatefulWidget {
  @override
  State<InfoSummuryForm> createState() => _InfoSummuryFormState();
}

class _InfoSummuryFormState extends State<InfoSummuryForm> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.call),
                    hintText: '90000000',
                    helperText: 'Numéro de téléphone',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Togbevi Angelica Sylvana Abla',
                    helperText: 'Nom complet',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.person),
                    hintText: '20',
                    helperText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.email),
                    hintText: 'angelicatogbevi@gmail.com',
                    helperText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Féminin',
                    helperText: 'Sexe',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.school),
                    hintText: 'Licence',
                    helperText: 'Niveau scolaire',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Célibataire',
                    helperText: 'Situation matrimoniale',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.work),
                    hintText: 'Ingénieure en IA',
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
                        onPressed: () {},
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
                        onPressed: () {},
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
    );
  }
}
