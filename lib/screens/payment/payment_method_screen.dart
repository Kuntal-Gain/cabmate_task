import 'package:cabmate_task/screens/payment/payment_success.dart';
import 'package:cabmate_task/utils/payment.dart';
import 'package:cabmate_task/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<Payment> methods = [
    Payment(icon: Icons.credit_card, label: "Card", value: "123 456 789"),
    Payment(icon: Icons.wallet, label: "Wallet", value: "\$115.00"),
  ];

  int selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Select Payment Method',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xfff6f6f6),
              border: Border.all(
                color: const Color(0xffc2c2c2),
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListView.builder(
              itemCount: methods.length,
              itemBuilder: (ctx, idx) {
                final pm = methods[idx];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIdx = idx;
                    });
                  },
                  child: paymentCard(
                      pm.icon, pm.label, selectedIdx == idx, pm.value),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()),
              );
            },
            child: Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
