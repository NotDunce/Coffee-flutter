import 'package:coffee_flutter/components/bottom_nav.dart';
import 'package:coffee_flutter/pages/extra_home.dart';
import 'package:coffee_flutter/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //checks if the user is logged in or not then redirects to main page
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData){
            return myNavBar();
          }

          //user is not logged in 
          else{
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}