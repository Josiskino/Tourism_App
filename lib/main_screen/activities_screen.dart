import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/entities/transactions.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transactions> transactions = Transactions.transactions();

    final screenWight = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const screenPadding = EdgeInsets.symmetric(horizontal: 14);
    final spaceBetweenItems = screenHeight * 0.03;

    final containerWidth = screenWight * 0.33 - 12;
    final containerHeight = screenHeight * 1;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: screenPadding,
                child: Column(
                  children: [
                    SizedBox(
                      height: spaceBetweenItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          //margin: EdgeInsets.only(right: screenWight * 0.9),
                          height: screenHeight * 0.06,
                          width: screenWight * 0.70,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.grey),
                              hintText: 'Search',
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.06,
                          width: screenWight * 0.2,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6600),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Iconsax.filter,
                                color: Color(0xFFFFFFA1),
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(
                                    color: Color(0xFFFFFFA1), fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spaceBetweenItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: containerWidth,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE6F7E9), // Vert pâle
                                Color(0xFFE3E9F3), // Bleu pâle
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 9, left: 5),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              decoration: BoxDecoration(
                                                color: Colors.green[100],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.car_rental,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 17, left: 50),
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, right: 70),
                                child: Text(
                                  "Cars",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: containerWidth,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFE0B2), // Orange pâle
                                Color(0xFFF8F3F7), // Blanc cassé
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 9, left: 5),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              decoration: BoxDecoration(
                                                color: Colors.orange[100],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.flight,
                                                  color: Color(
                                                      0xFFDA6F0B), // Orange foncé
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 17, left: 50),
                                    child: Text(
                                      "5",
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, right: 60),
                                child: Text(
                                  "Flight",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: containerWidth,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE9E1F1), // Violet pâle
                                Color(0xFFF8F3F7), // Blanc cassé
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 9, left: 5),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 34,
                                              width: 34,
                                              decoration: BoxDecoration(
                                                color: Colors.indigo[100],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Iconsax.building,
                                                  color: Color(
                                                      0xFFAB44D4), // Violet foncé
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 17, left: 50),
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, right: 60),
                                child: Text(
                                  "Hotel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: screenPadding,
                child: Container(
                  height: containerHeight * 0.11,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            buildInitialContainer("RM", 1,
                                const Color.fromARGB(255, 245, 232, 121)),
                            buildInitialContainer("AB", 25,
                                const Color.fromARGB(255, 119, 180, 121)),
                            buildInitialContainer("CD", 47,
                                const Color.fromARGB(255, 138, 191, 235)),
                            //buildInitialContainer("EF", 60, Colors.red),
                            //buildInitialContainer("GH", 80, Colors.orange),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 50,
                            width: 150,
                            //color: Colors.yellow,
                            child: const Text(
                              "You have 3 friends invited for your trip",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1d1f21),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6600),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Invite",
                            style: TextStyle(
                              color: Color(0xFFFFFFA1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spaceBetweenItems,
              ),
              //affichage des transactions
              Padding(
                padding: screenPadding,
                child: SizedBox(
                  height: containerHeight,
                  width: screenWight,
                  //color: Colors.blue,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      //height: 120,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 05, left: 15),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red[100],
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: const Icon(
                                      Icons.arrow_downward,
                                      color: Color.fromARGB(255, 252, 23, 6),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 20,),
                                  child: Text("- ${transactions[index].amountSend}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 60,),
                                  child: Container(
                                    height: 25,
                                    width: 118,
                                    decoration: BoxDecoration(
                                      color: getTransactionStatusColor(transactions[index].transactionStatus),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Icon(
                                            Icons.access_time_filled,
                                            color: Color(0xFF444648),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.5),
                                          child: Text(transactions[index].transactionStatus),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Divider(color: Colors.grey,),
                          ),
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                const Text("Payment for product"),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  onPressed: () {
                                    //context.read<DropdownCubit>().toggle();
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Divider(color: Colors.grey,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Recever",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 136, 143, 150),       
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "R",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: Text(
                                        transactions[index].sender,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 17,),
                                const Text(
                                      "PAYMENT METHOD",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 136, 143, 150),
                                      ),
                                    ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text(
                                      transactions[index].transactionMethod!,
                                    ),
                                    const Spacer(),
                                Text("Ref: ${transactions[index].transactionRef.toString()}")
                            
                                  ],
                                ),
                                const SizedBox(height: 14,),
                                const Text(
                                  "DATE",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 136, 143, 150),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text(transactions[index].transactionDateTime.toString())
                                  ],
                                ),
                            
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,)
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: Transactions.transactions().length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildInitialContainer(String initials, double offset, Color color) {
  return Transform.translate(
    offset: Offset(offset, 0),
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

 Color getTransactionStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return const Color.fromARGB(255, 191, 243, 193);
      case 'Pending':
        return const Color.fromARGB(255, 216, 213, 213);
      case 'Failed':
        return const Color.fromARGB(255, 243, 193, 193);
      default:
        return Colors.grey;
    }
  }

