import 'package:flutter/material.dart';

import '../components/my_tile.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 48,),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Welcome to FreshBrews!", style: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            

            SizedBox(height: 7.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Welcome to FreshBrews!", style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold)),
            ),

            SizedBox(height: 24,),

            const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),


             SizedBox(height: 48,),

             Center(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                  child: Image.asset('lib/images/coffeeBetter.png'),
                  height: 180,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    
                  ),
                 ),
               ),
             ),

             SizedBox(height: 25,),

            Expanded(child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
            return MyTile(title: "Strawberry Mocha", content: 'A strawberry mocha coffee of the day is a delicious and unique drink, packed with immaculate flavour!',);
          }),),


          ]
        ),
      ),
    );
  }
}