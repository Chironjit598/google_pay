import 'package:flutter/material.dart';
import 'package:google_and_apple_pay/payment_config.dart';
import 'package:pay/pay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GooglePayButton googlePayButton;

  @override
  void initState() {
    super.initState();

    googlePayButton = GooglePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: const [
        PaymentItem(
          label: 'Total',
          amount: '0.01', // test amount
          status: PaymentItemStatus.final_price,
        )
      ],
      type: GooglePayButtonType.pay,
      onPaymentResult: (result) {
        debugPrint('Payment Result: $result');
        // You can show dialog or toast here on payment success/fail
      },
      loadingIndicator: const Center(child: CircularProgressIndicator()),
      margin: const EdgeInsets.only(top: 15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Pay Test'),
      ),
      body: Center(
        child: googlePayButton,
      ),
    );
  }
}