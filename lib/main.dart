import 'package:coffee_flutter/components/bottom_nav.dart';
import 'package:coffee_flutter/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/cart_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      )

    );
  }
}