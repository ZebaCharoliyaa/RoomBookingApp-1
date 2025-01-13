import 'package:flutter/material.dart';

class Confirmpayment extends StatefulWidget {
  const Confirmpayment({super.key});

  @override
  State<Confirmpayment> createState() => _ConfirmpaymentState();
}

class _ConfirmpaymentState extends State<Confirmpayment> {
  String? selectedPayment; // Define the selectedPayment variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        // backgroundColor: Colors.orange.shade100,
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bank Transfer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Payment Options List
            _paymentOption('Bank Central Asia'),
            _paymentOption('Bank Negara Indonesia'),
            _paymentOption('Bank Mandiri'),
            _paymentOption('Bank Rakyat Indonesia'),
           
            SizedBox(height: 10),
            // Other Payment Methods
            Text(
              'Other Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _paymentOption('Credit/Debit Card'),
            _paymentOption('Paypal'),
            SizedBox(height: 20),
            // Confirm Payment Button
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  // Navigate to Payment Success Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessPage(),
                    ),
                  );
                },
                child: Text(
                  'Confirm Payment',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Payment Option Widget
  Widget _paymentOption(String paymentTitle) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(
          Icons.account_balance,
          color: Colors.orange,
        ),
        title: Text(paymentTitle),
        trailing: Radio<String>(
          value: paymentTitle,
          groupValue: selectedPayment,
          activeColor: Colors.orange,
          onChanged: (value) {
            setState(() {
              selectedPayment = value!;
            });
          },
        ),
      ),
    );
  }
}

class PaymentSuccessPage extends StatefulWidget {
  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();  // Start the animation immediately

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _colorAnimation = ColorTween(begin: Colors.orange.shade100, end: Colors.orange).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _iconAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _colorAnimation.value,
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: _iconAnimation.value,
                      child: Icon(
                        Icons.check_circle,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Payment Success!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              'Your payment was successful.\nJust wait until your skincare arrives at home.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                'Back to Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
