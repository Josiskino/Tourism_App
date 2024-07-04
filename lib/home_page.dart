import 'package:flutter/material.dart';
import 'package:myapp/places_component.dart';
import 'package:myapp/search_bar_component.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(
            text: 'where do \n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' you want to go ?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ]
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255, 220, 201, 1),
                ), 
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFF7F7F7),
                  /*boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],*/
                ),
                child: const SearchBarComponent(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 500,
              width: double.infinity,
              //color: Colors.blue,
              child: PlacesComponent(),
              
            ),
          ],
        ),
      ),
    );
  }
}
