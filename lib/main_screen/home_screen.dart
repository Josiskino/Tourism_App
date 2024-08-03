import 'package:flutter/material.dart';
import 'package:myapp/entities/categories.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/main_screen/components/home_screen_body_section.dart';
import 'package:myapp/main_screen/components/home_screen_header_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Categories> categories = Categories.categories();
  final List<Sites> sites = Sites.sites();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
           // color: const Color(0xFF111111),
           //Color(0xFFCCCCCC)
           color: const Color(0xFFFF6600),
            child:  Column(
              //Pour toute l'interface
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: HomeScreenHeaderSection(),
                ),
                HomeScreenBodySection(),                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
