import 'package:auth_test/firebase_options.dart';
import 'package:auth_test/form2.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //cWXsxPCLRVCK8jDHN-WvYO:APA91bHys8xkwZeCNyH8sVRMGzJ66sDPrpHH1qozgEWgcWpKNi7PnWrw-g7dFbgjHYJPS0k2ig4y_L_xmK1f8J70DGGRBV63gdV3tTVlM3GLLw5O_-o_ZtP0YybXIfcQC4wAlZgEUqFl
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  options:
  DefaultFirebaseOptions.currentPlatform;
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Formulaire2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
