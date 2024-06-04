import 'package:auth_test/widgets/infos_sum_form.dart';
import 'package:flutter/material.dart';

class InfoSummury extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Votre compte',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Veuillez vérifier vos informations',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 40),
              Container(
                child: InfoSummuryForm(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
