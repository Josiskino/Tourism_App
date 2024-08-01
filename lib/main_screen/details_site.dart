import 'package:flutter/material.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/main_screen/widgets/details_site_sliver.dart';

class DetailsSite extends StatelessWidget {
  const DetailsSite(this.sites, {super.key});

  final Sites sites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailsSiteSliverDelegate(
              sites: sites, 
              expandedHeight: 350, 
              roundedContainerHeight: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}