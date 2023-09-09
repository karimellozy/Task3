import 'package:flutter/material.dart';

import 'log_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Image.asset(
        "assets/photo-1518531933037-91b2f5f229cc.png",
        fit: BoxFit.cover,
      ),
      Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 70,
                ),
            const Column(
              children: [
                Text("The best \n app for\n your plants",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Column(children: [
              Container(
                width: 250, // Set the desired width
                height: 40, // Set the desired height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.transparent, // Set your desired background color
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius value
                      ),
                    ),// Set the background color to transparent
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 15,
            ),
            Column(children: [
              GestureDetector(
                onTap: () {
                  // Respond to the tap on the text
                  print('Text tapped');
                  // You can perform any action you want here
                },
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Colors.white, // You can change the text color
                  ),
                ),
              )
            ])
          ])),
    ]));
  }
}
