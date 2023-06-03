import 'dart:convert';
import 'dart:io';

import 'package:coffee_flutter/model/content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class PickerPage extends StatelessWidget {
   PickerPage({super.key});
  //list of coffees
  final List<CoffeeCup> coffeeCups =[];

  //get coffee 
  Future getCoffee() async {
    var response = await http.get(Uri.https('api.sampleapis.com','/coffee/hot'));
    var jsonData = jsonDecode(response.body);

    for (var eachCoffee in jsonData){
      final coffeeCup = CoffeeCup(title: eachCoffee['title'],description: eachCoffee['description'], image: eachCoffee['image']);
      coffeeCups.add(coffeeCup);
    }

    print(coffeeCups.length);
  }

  @override
  Widget build(BuildContext context) {
    getCoffee();
    return Scaffold(
      //using a future builder to await content from the json
      body: FutureBuilder(
        future: getCoffee(),
        builder: (context, snapshot) {
          //is api done loading 
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount: coffeeCups.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(coffeeCups[index].title, textAlign: TextAlign.center ,),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink
                        ),
                        
                        
                        child: Image.network(coffeeCups[index].image, 
                        fit: BoxFit.fill,
                        height: 500,
                        width: 50
                        
                        ),
                        
                        
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(coffeeCups[index].description),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            //returns a progress indicator until api call is successful
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange[200],
              ),
            );
          }

        },
      
      ),
      
    
    );
  }
}