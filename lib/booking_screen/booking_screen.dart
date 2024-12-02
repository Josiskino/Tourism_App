import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/payment_screen/payment_screen.dart';

class BookingScreen extends StatefulWidget {
  final Sites site;

  const BookingScreen({super.key, required this.site});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int numberOfPersons = 1;
  DateTime? selectedDate;
  String? selectedTime;
  final List<String> timeSlots = [
    '09:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
  ];

  double get totalPrice =>
      numberOfPersons * double.parse(widget.site.price.replaceAll(',', ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Booking Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeUtil.textSize(4.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Site Information
                  _buildSectionTitle('Site Information'),
                  _buildSiteInfo(),

                  const SizedBox(height: 25),

                  // Number of Persons
                  _buildSectionTitle('Number of Persons'),
                  _buildPersonCounter(),

                  const SizedBox(height: 25),

                  // Date Selection
                  _buildSectionTitle('Booking Date'),
                  _buildDatePicker(),

                  const SizedBox(height: 25),

                  // Time Selection
                  _buildSectionTitle('Select Time'),
                  _buildTimeSelection(),

                  const SizedBox(height: 25),

                  // Booking Summary
                  _buildSectionTitle('Booking Summary'),
                  _buildBookingSummary(),
                ],
              ),
            ),
          ),

          // Bottom Payment Button
          _buildPaymentButton(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: SizeUtil.textSize(4.5),
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSiteInfo() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.site.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.site.name,
                  style: TextStyle(
                    fontSize: SizeUtil.textSize(4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.site.localisation,
                  style: TextStyle(
                    fontSize: SizeUtil.textSize(3.5),
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'XOF ${widget.site.price} per person',
                  style: TextStyle(
                    fontSize: SizeUtil.textSize(3.3),
                    color: const Color(0xFFFF983F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonCounter() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Person(s)',
            style: TextStyle(
              fontSize: SizeUtil.textSize(3.8),
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              _buildCounterButton(
                icon: Icons.remove,
                onPressed: () {
                  if (numberOfPersons > 1) {
                    setState(() => numberOfPersons--);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  numberOfPersons.toString(),
                  style: TextStyle(
                    fontSize: SizeUtil.textSize(4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildCounterButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() => numberOfPersons++);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 90)),
        );
        if (picked != null) {
          setState(() => selectedDate = picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? 'Select Date'
                  : DateFormat('dd MMM yyyy').format(selectedDate!),
              style: TextStyle(
                fontSize: SizeUtil.textSize(3.8),
                color: selectedDate == null ? Colors.grey : Colors.black87,
              ),
            ),
            const Icon(Icons.calendar_today, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelection() {
    return Container(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: timeSlots.length,
        itemBuilder: (context, index) {
          final time = timeSlots[index];
          final isSelected = selectedTime == time;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => setState(() => selectedTime = time),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFFFF983F) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    time,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookingSummary() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Number of Persons', '$numberOfPersons'),
          _buildSummaryRow('Price per Person', 'XOF ${widget.site.price}'),
          _buildSummaryRow(
            'Date',
            selectedDate == null
                ? 'Not selected'
                : DateFormat('dd MMM yyyy').format(selectedDate!),
          ),
          _buildSummaryRow('Time', selectedTime ?? 'Not selected'),
          const Divider(height: 20),
          _buildSummaryRow(
            'Total Amount',
            'XOF ${NumberFormat('#,###').format(totalPrice)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: SizeUtil.textSize(isTotal ? 4 : 3.5),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: SizeUtil.textSize(isTotal ? 4 : 3.5),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? const Color(0xFFFF983F) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.05),
      //       offset: const Offset(0, -4),
      //       blurRadius: 8,
      //     ),
      //   ],
      // ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: selectedDate != null && selectedTime != null
              ? () => _showPaymentMethods()
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF983F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            'Proceed to Payment',
            style: TextStyle(
              fontSize: SizeUtil.textSize(4),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showPaymentMethods() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => PaymentMethodsSheet(
        totalAmount: totalPrice,
        onPaymentComplete: () {
          // Handle payment completion
          Navigator.pop(context);
          // Show success message or navigate to confirmation screen
        },
      ),
    );
  }
}

