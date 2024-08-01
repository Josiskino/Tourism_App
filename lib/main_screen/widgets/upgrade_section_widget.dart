import 'package:flutter/material.dart';

class UpgradeSectionWidget extends StatelessWidget {
  const UpgradeSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(109, 71, 255, 1),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1, 
            blurRadius: 10, 
            offset: const Offset(0, 6), 
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: Container(
                  height: 30,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(250, 186, 0, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'PRO',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Upgrade to Premium',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20,), 
              Padding(padding: const EdgeInsets.only(top: 15, right: 20), child: CircleAvatar(
                  radius: 15.0, // Adjust the radius as needed
                  backgroundColor: Colors.white,
                  child: Container(
                    width: 30.0, // Should be 2 times the radius for a perfect circle
                    height: 30.0,
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right),
                      color: Colors.black, // Change icon color if needed
                      iconSize: 19.0, // Adjust the size of the icon
                    ),
                  ),
                ),)
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Upgrade to premium today and take your gym ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
            ),
        ],
      ),
    );
  }
}