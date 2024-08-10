import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/core/constants/image_strings.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/main_screen/widgets/details_site_sliver.dart';

class DetailsSite extends StatelessWidget {
  const DetailsSite(this.sites, {super.key});

  final Sites sites;

  @override
  Widget build(BuildContext context) {
    final screenWight = MediaQuery.of(context).size.width;
    
    final Completer<GoogleMapController> _mapController =
        Completer<GoogleMapController>();
    const LatLng _pSogbossito = LatLng(6.2089, 1.2130);

    final bottomContainerHeight = SizeUtil.heightPercentage(10);
    final bottomContainerWidth = SizeUtil.widthPercentage(100);

    final bookingBtnHeight = bottomContainerHeight * 0.7;
    final bookingBtnWidth = bottomContainerWidth * 0.65;

    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: bottomContainerHeight,
        //color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: bookingBtnHeight,
              width: bookingBtnWidth,
              decoration: BoxDecoration(
                color: const Color(0xFFFF983F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    color: const Color(0xFFFFFFA1),
                    fontSize: SizeUtil.textSize(5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: bottomContainerHeight * 0.7,
              width: bottomContainerWidth * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFFF983F),
                  width: 1,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_outline,
                  color: Color(0xFFFF983F),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailsSiteSliverDelegate(
              sites: sites,
              expandedHeight: SizeUtil.heightPercentage(50),
              roundedContainerHeight: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //height: screenHeight,
              color: const Color(0xFFFFFFFF),
              child: Padding(
                padding: EdgeInsets.only(
                  top: SizeUtil.spacing(5),
                  left: SizeUtil.spacing(5),
                  right: SizeUtil.spacing(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sites.name,
                              style: TextStyle(
                                color: const Color(0xFF1D1F21),
                                fontSize: SizeUtil.textSize(6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                 Icon(
                                  Icons.location_on_outlined,
                                  color: const Color(0xFF1D1F21),
                                  size: SizeUtil.iconSize(5),
                                ),
                                SizedBox(
                                  width: SizeUtil.spacing(1),
                                ),
                                Text(
                                  sites.localisation,
                                  style: TextStyle(
                                    color: const Color(0xFF1D1F21),
                                    fontSize: SizeUtil.textSize(4),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: SizeUtil.heightPercentage(6),
                          width: SizeUtil.widthPercentage(30),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF983F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              sites.price.isNotEmpty
                                  ? "XOF ${sites.price}"
                                  : "FREE",
                              style: TextStyle(
                                color: const Color(0xFFFFFFA1),
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtil.textSize(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeUtil.spacing(5),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeUtil.heightPercentage(6.5),
                          child: Stack(
                            children: [
                               buildProfilePicture(const AssetImage(tProfilImage1), 0),
                               buildProfilePicture(const AssetImage(tProfilImage2), 18),
                               buildProfilePicture(const AssetImage(tProfilImage3), 39),
                            ],
                          ),
                        ),
                        Text(
                          "+20 Traveler",
                          style: TextStyle(
                            color: const Color(0xFF1D1F21),
                            fontSize: SizeUtil.textSize(4),
                          ),
                        ),
                        SizedBox(
                          height: SizeUtil.spacing(3.5),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Description",
                          style: TextStyle(
                          fontSize: SizeUtil.textSize(5.5),
                          color: const Color(0xFF1D1F21), 
                          fontWeight: FontWeight.bold,
                         ),
                        ),
                        Text(
                          sites.description.isNotEmpty
                              ? sites.description
                              : "Description non disponible.",
                          style: const TextStyle(
                              fontSize: 16, 
                              color: Color(0xFF1D1F21),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: SizeUtil.spacing(3.5),
                    ),
                    const Text(
                      "Location",
                      style:
                          TextStyle(
                            fontSize: 18, 
                            color: Color(0xFF1D1F21),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                     SizedBox(
                      height: SizeUtil.spacing(3),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 130,
                        width: screenWight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          initialCameraPosition: const CameraPosition(
                            target: _pSogbossito,
                            zoom: 15,
                          ),
                          mapType: MapType.normal,
                          myLocationEnabled: false,
                          myLocationButtonEnabled: true,
                          compassEnabled: false,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          scrollGesturesEnabled: false,
                          tiltGesturesEnabled: true,
                          rotateGesturesEnabled: false,
                          markers: {
                            const Marker(
                              markerId: MarkerId('_currentLocation'),
                              icon: BitmapDescriptor.defaultMarker,
                              position: _pSogbossito,
                            ),
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildProfilePicture(ImageProvider imageProvider, double offset) {
  return Transform.translate(
    offset: Offset(offset, 0),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 2), 
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover, 
        ),
      ),
    ),
  );
}
