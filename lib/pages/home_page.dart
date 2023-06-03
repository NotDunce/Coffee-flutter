import 'package:coffee_flutter/components/coffee_item_tile.dart';
import 'package:coffee_flutter/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


//outline requirements, wireframes, implementation of cart etc


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        },)),
        backgroundColor: Colors.orange[200],
        child: Icon(Icons.shopping_bag),
        ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 48),

          //greeting the user
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Good Morning,",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),

          SizedBox(height: 7.0),
          //ordering fresh brew
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "New brew, made just for you!",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 24.0),

          //divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          SizedBox(height: 24.0),

          //fresh coffee and grid
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Brewed fresh every morning!",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),

          SizedBox(height: 24.0),

          Expanded(child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                padding: EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //changes the aspect ratio x and y 1.2 makes it more of a rectangle 1,1 is default and will be a square
                    childAspectRatio: 1 / 1.2,
                    ),
                itemBuilder: (context, index) {
                  return coffeeItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                    },
                  );
                },
              );
            },
          )),
        ]),
      ),
    );
  }
}
