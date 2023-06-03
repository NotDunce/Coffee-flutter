import 'package:flutter/material.dart';

class coffeeItemTile extends StatelessWidget {


  //what information will be needed about the coffee
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  //defining it within the class constructor - when a new object of the class is called, it will require: name, price, imagePath & color.
   coffeeItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //image
          
          Image.asset(
            imagePath,
            height: 70,),

         
          
          //item name
          Text(itemName),

       

          //price and button
          MaterialButton(
            onPressed: onPressed,
            color: color[500],
            child: Text('\£'+itemPrice, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          
          )
        ],
          

        ),
      ),
    );
  }
}