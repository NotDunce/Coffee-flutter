import 'package:coffee_flutter/components/MyButton.dart';
import 'package:coffee_flutter/components/login_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_flutter/pages/home_page.dart';

import '../components/bottom_nav.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
          
    }
    
     on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        wrongPasswordMessage();
      }
    }
    //pop the loading circle
    Navigator.pop(context);

    //pop the loading circle
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect password'),
        );
      },
    );
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //welcome to the site, to use this app, please sign in or create an account
          SizedBox(height: 90.0),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "Welcome to FreshBrews!",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          const Text(
            "Please sign in or create an account below.",
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 25.0),

          //email section
          MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false),

          SizedBox(height: 5.0),

          //password
          MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true),

          SizedBox(height: 25.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(
                  width: 100,
                  child: Text(
                    "Not a member?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          //sign in button that leads straight to home screen
          MyButton(
            onTap: signUserIn,
            text: 'Sign in',
          ),

          SizedBox(height: 25.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Or sign in with...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          //apple, google sign in

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //google button
                loginTile(imagePath: 'lib/images/google.png'),

                SizedBox(width: 40),

                //apple button
                loginTile(imagePath: 'lib/images/apple.png')
              ],
            ),
          )

          //register cta
        ]),
      ),
    );
  }
}
