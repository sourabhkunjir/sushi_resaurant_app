import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushirestaurantapp/components/button.dart';
import 'package:sushirestaurantapp/views/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 56, 51),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // shop name
                Text(
                  "SUSHI MAN",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                // icon
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset("assets/images/sushi2.png"),
                ),
                SizedBox(
                  height: 25,
                ),
                // title
                Text(
                  "THE TASTE OF JAPANESE FOOD",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 44, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                // subtitle
                Text(
                  "Feel the taste of the most popular Japanese food from anywhere and anytime",
                  style: TextStyle(color: Colors.grey[300], height: 2),
                ),
                SizedBox(
                  height: 25,
                ),
            
                // get started button
                MyButton(
                  text: "Get Started",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuPage(),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
