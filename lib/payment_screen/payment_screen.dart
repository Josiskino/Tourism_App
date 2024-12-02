import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/core/constants/image_strings.dart';
import 'package:myapp/core/util/phone_validator.dart';
import 'package:myapp/core/util/screen_size.dart';

class PaymentMethodsSheet extends StatelessWidget {
  final double totalAmount;
  final VoidCallback onPaymentComplete;

  const PaymentMethodsSheet({
    super.key,
    required this.totalAmount,
    required this.onPaymentComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: SizeUtil.textSize(4.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildPaymentOption(
                    context,
                    'Mobile Money',
                    Icons.phone_android,
                    ['T-Money', 'Flooz'],
                  ),
                  _buildPaymentOption(
                    context,
                    'Bank Card',
                    Icons.credit_card,
                    ['Visa', 'Mastercard'],
                  ),
                  _buildPaymentOption(
                    context,
                    'Cash',
                    Icons.money,
                    ['Pay at location'],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    String title,
    IconData icon,
    List<String> methods,
  ) {
    bool showSoonTag = title == 'Bank Card' || title == 'Cash';

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ListTile(
            onTap: showSoonTag
                ? null
                : () {
                    if (title == 'Mobile Money') {
                      _showMobileMoneyOptions(context);
                    } else {
                      Navigator.pop(context);
                      onPaymentComplete();
                    }
                  },
            leading: Icon(icon,
                color: showSoonTag ? Colors.grey : const Color(0xFFFF983F)),
            title: Text(
              title,
              style: TextStyle(
                fontSize: SizeUtil.textSize(4),
                fontWeight: FontWeight.bold,
                color: showSoonTag ? Colors.grey : Colors.black,
              ),
            ),
            subtitle: Text(
              methods.join(' • '),
              style: TextStyle(
                fontSize: SizeUtil.textSize(3.5),
                color: Colors.grey[600],
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: showSoonTag ? Colors.grey : const Color(0xFFFF983F),
            ),
          ),
          if (showSoonTag)
            Positioned(
              top: 8,
              right: 45,
              child: Transform.rotate(
                angle: -0.2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF983F), Color(0xFFFFAB5E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF983F).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(
                      //   Icons.access_time_rounded,
                      //   size: 14,
                      //   color: Colors.white,
                      // ),
                      // const SizedBox(width: 4),
                      Text(
                        'Soon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeUtil.textSize(2.8),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showMobileMoneyOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Mobile Money',
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(4.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose your mobile money provider',
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(3.5),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildMobileMoneyOption(
                      context,
                      'T-Money',
                      tPaymentMethodsSheetImage1,
                      '9X XX XX XX',
                    ),
                    _buildMobileMoneyOption(
                      context,
                      'Flooz',
                      tPaymentMethodsSheetImage2,
                      '7X XX XX XX',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SafeArea(
                child: Text(
                  'You will receive a prompt on your phone to complete the payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeUtil.textSize(3.5),
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMoneyOption(
    BuildContext context,
    String provider,
    String logoPath,
    String numberFormat,
  ) {
    return GestureDetector(
      onTap: () {
        _showPhoneNumberInput(context, provider);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  logoPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.account_balance_wallet,
                    color: Color(0xFFFF983F),
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider,
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Format: $numberFormat',
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(3.5),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  void _showPhoneNumberInput(BuildContext context, String provider) {
    TextEditingController phoneController = TextEditingController();
    bool isValidNumber = false;
    String? errorMessage;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ... En-tête inchangé ...
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider,
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(4.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            provider == 'T-Money'
                                ? 'Entrez votre numéro Togocel (90, 91, 92, 93)'
                                : 'Entrez votre numéro Moov (96, 97, 98, 99)',
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.5),
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: errorMessage != null
                                    ? Colors.red
                                    : Colors.grey[300]!,
                              ),
                            ),
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: SizeUtil.textSize(4)),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(8),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  final text = newValue.text;
                                  if (text.length <= 2) return newValue;

                                  String formatted = '';
                                  for (int i = 0; i < text.length; i++) {
                                    if (i == 2 || i == 4 || i == 6) {
                                      formatted += ' ';
                                    }
                                    formatted += text[i];
                                  }

                                  return TextEditingValue(
                                    text: formatted,
                                    selection: TextSelection.collapsed(
                                      offset: formatted.length,
                                    ),
                                  );
                                }),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: provider == 'T-Money'
                                    ? '90 XX XX XX'
                                    : '96 XX XX XX',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: SizeUtil.textSize(4),
                                ),
                              ),
                              onChanged: (value) {
                                final cleanValue =
                                    value.replaceAll(RegExp(r'\D'), '');
                                setState(() {
                                  errorMessage =
                                      PhoneValidator.validateInProgress(
                                          cleanValue, provider);
                                  isValidNumber = errorMessage == null;
                                });
                              },
                            ),
                          ),
                          if (errorMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12),
                              child: Text(
                                errorMessage!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: SizeUtil.textSize(3),
                                ),
                              ),
                            ),
                          const SizedBox(height: 20),
                          SafeArea(
                            child: ElevatedButton(
                              onPressed: isValidNumber
                                  ? () {
                                      final cleanValue = phoneController.text
                                          .replaceAll(RegExp(r'\D'), '');
                                      final finalError =
                                          PhoneValidator.validatePhoneNumber(
                                              cleanValue, provider);

                                      if (finalError != null) {
                                        setState(() {
                                          errorMessage = finalError;
                                        });
                                        return;
                                      }

                                      _showConfirmation(context, provider,
                                          phoneController.text);
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF983F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: Text(
                                'Confirmer le paiement',
                                style: TextStyle(
                                  fontSize: SizeUtil.textSize(4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmation(BuildContext context, String provider, String phone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.phone_android,
              size: 50,
              color: Color(0xFFFF983F),
            ),
            const SizedBox(height: 20),
            Text(
              'Check your phone',
              style: TextStyle(
                fontSize: SizeUtil.textSize(4.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'A payment request has been sent to\n$phone',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeUtil.textSize(3.5),
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fermer tous les bottomSheets et dialogues
                Navigator.of(context).popUntil((route) => route.isFirst);
                // Appeler votre callback de succès ici
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF983F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('OK, Got it'),
            ),
          ],
        ),
      ),
    );
  }
}
