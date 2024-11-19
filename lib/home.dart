import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _amountInput = '';

  void _setAmountInput(String value) {
    setState(() {
      _amountInput = value;
    });
  }

  // final TextEditingController _amountController = TextEditingController();

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  String calculateTip(double amount, {double percentage = 15}) {
    final tip = percentage / 100 * amount;
    return NumberFormat.simpleCurrency().format(tip);
  }

  @override
  Widget build(BuildContext context) {
    final amount = double.tryParse(_amountInput) ?? 0.00;
    // final amount = double.tryParse(_amountController.text) ?? 0.00;
    final tip = calculateTip(amount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: GestureDetector(
        onTap: _dismissKeyboard,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Calculate Tip',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
              buildAmountInputField(),
              const SizedBox(height: 20),
              Text(
                'Tip Amount: $tip',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAmountInputField() {
    return TextField(
      // controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text(
          'Bill Amount',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.red[800],
          ),
        ),
        fillColor: Colors.red[100],
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: (value) => _setAmountInput(value),
    );
  }
}
