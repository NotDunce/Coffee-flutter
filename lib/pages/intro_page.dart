import 'package:coffee_flutter/pages/auth_page.dart';
import 'package:coffee_flutter/pages/home_page.dart';
import 'package:coffee_flutter/pages/login_page.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // coffee store logo
      Padding(
        padding: const EdgeInsets.only(left:80.0, right:80.0,bottom:80,top:120),
        child: Image.asset('lib/images/coffeeBetter.png'),
      ),

      //we love to brew you delicious coffee
      const Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textAlign: TextAlign.center,
          "We love to brew delicious coffee!",
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      Text("Freshly brews daily", style: TextStyle(color: Colors.grey[600])),

      const Spacer(),
      //get started button - leads to login
      GestureDetector(
        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context){
            return AuthPage();
          }
        )),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          child: Text("Get started", style: TextStyle(color: Colors.white),),
        ),
      )
      ,
      const Spacer(),
    ]));
  }
}
