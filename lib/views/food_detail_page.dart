import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurantapp/components/button.dart';
import 'package:sushirestaurantapp/models/food.dart';
import 'package:sushirestaurantapp/models/shop.dart';
import 'package:sushirestaurantapp/themes/colors.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview of food details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                // image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                // rating
                Row(
                  children: [
                    //star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // rating number
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // food name
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                SizedBox(
                  height: 25,
                ),
                // description
                Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Delicate sliced, fresh salmon drape elegantly over a pillow of perfectly seasoned sushi rice, creating a harmonious balance of flavors and textures. Each bite offers a melt-in-your-mouth experience, with the rich, buttery taste of the salmon seamlessly melding with the subtly tangy rice. Garnished with a hint of wasabi and a touch of pickled ginger, this exquisite dish is a testament to the art of sushi-making, inviting you to savor every nuanced layer of taste and artistry.",
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 14, height: 2),
                )
              ],
            ),
          )),
          // price +quantity +add to cart button
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        "\$" + widget.food.price,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      // quantity
                      Row(
                        children: [
                          // minus button
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: decrementQuantity,
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                          ),
                          // quantity count
                          SizedBox(
                              width: 40,
                              child: Center(
                                  child: Text(
                                quantiyCount.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ))),

                          // plus button
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: incrementQuantity,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //add to cart button
                  MyButton(text: "Add to cart", onTap: addToCart)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  int quantiyCount = 0;
  // to decrement the counter
  void decrementQuantity() {
    setState(() {
      if (quantiyCount > 0) {
        quantiyCount--;
      }
    });
  }

  // increment the counter
  void incrementQuantity() {
    setState(() {
      quantiyCount++;
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart if there is something in the cart
    if (quantiyCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantiyCount);
      // let the user know it was sucessful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Sucessfully added to cart"),
          actions: [
            // okay button
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.done))
          ],
        ),
      );
    }
  }
}
