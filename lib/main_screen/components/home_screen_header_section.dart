import 'package:flutter/material.dart';
import 'package:myapp/main_screen/widgets/home_screen_localisation.dart';
import 'package:myapp/main_screen/widgets/home_screen_search_bar.dart';
import 'package:myapp/notifications/notifications_screen.dart';

class HomeScreenHeaderSection extends StatelessWidget {
  const HomeScreenHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const HomeScreenLocalisation(),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                //color: Color(0xFF2E2E2E),
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                  child: const Badge(
                      offset: Offset(2, 2.5),
                      label: Text("2"),
                      child: Icon(
                        Icons.notifications_outlined,
                        //color: Theme.of(context).colorScheme.primary,
                        //color: Color(0xFFFF983F),
                        color: Color(0xFF444648),
                        size: 30.0,
                      )
                      //const Icon(
                      //   Icons.notifications_outlined,
                      //   //color: Theme.of(context).colorScheme.primary,
                      //   //color: Color(0xFFFF983F),
                      //   color: Color(0xFF444648),
                      //   size: 30.0,
                      // ),
                      ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 25),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              //color: const Color(0xFF2E2E2E),
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const HomeScreenSearchBar(),
          ),
        ),
      ],
    );
  }
}
