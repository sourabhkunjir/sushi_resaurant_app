import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurantapp/components/button.dart';
import 'package:sushirestaurantapp/models/food.dart';
import 'package:sushirestaurantapp/models/shop.dart';
import 'package:sushirestaurantapp/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];
                  // get food name
                  final String foodName = food.name;
                  // get food price
                  final String foodPrice = food.price;
                  // return list tile
                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(foodName),
                      subtitle: Text(foodPrice),
                      trailing: IconButton(
                          onPressed: () => removeFromCart(food, context),
                          icon: Icon(Icons.delete)),
                    ),
                  );
                },
              ),
            ),
            // Spacer(),
            // pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay now",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
