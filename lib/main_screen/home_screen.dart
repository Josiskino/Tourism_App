import 'package:flutter/material.dart';
import 'package:myapp/core/util/screen_size.dart';
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
    return SafeArea(
      child: Scaffold(
        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       pinned: true,
        //       floating: true,
        //       expandedHeight: MediaQuery.of(context).size.height * 0.1,
        //       automaticallyImplyLeading: false,
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "Lomé, Agoè",
        //               style: TextStyle(
        //                 color: const Color(0xFFFFFFA1),
        //                 fontSize: SizeUtil.textSize(4),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 20,
        //               width: 20,
        //               child: IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.arrow_drop_down,
        //                   color: Color(0xFFFFFFA1),
        //                   size: 30,
        //                 ),
        //               ),
        //             ),
        //             IconButton(
        //               icon:
        //                   const Icon(Icons.notifications, color: Colors.white),
        //               onPressed: () {
        //                 // Action de notification ici
        //               },
        //             ),
        //           ],
        //         ),
        //         titlePadding:
        //             const EdgeInsetsDirectional.symmetric(vertical: 16),
        //         //centerTitle: true,
        //         //background: Image.asset(""),
        //       ),
        //     )
        //   ],
        // ),

        body: SingleChildScrollView(
          child: Container(
           // color: const Color(0xFF111111),
           //Color(0xFFCCCCCC)
           color: Theme.of(context).colorScheme.primary,
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
