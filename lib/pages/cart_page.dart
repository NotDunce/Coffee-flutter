import 'package:coffee_flutter/model/cart_model.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("My Cart", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: value.cartItems.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 36,
                          ),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text('£' + value.cartItems[index][1]),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              //total and pay now :)
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '£${value.calculateTotal()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      //pay now button
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: const [
                            Text("Pay Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]);
          },
        ));
  }
}
