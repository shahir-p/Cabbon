import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
      final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
     return Scaffold(
      body: Center(
        child: Text("Payments"),
      ),
    );
  }
}