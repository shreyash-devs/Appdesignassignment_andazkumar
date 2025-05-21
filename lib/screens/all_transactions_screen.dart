import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'package:intl/intl.dart';
import '../core/route_animation.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({Key? key}) : super(key: key);

  // Dummy list of transactions
  final List<Map<String, dynamic>> transactions = const [
    {
      'date': '2023-10-26',
      'description': 'CRED Rent Pay',
      'amount': -15000.0,
      'type': 'debit',
    },
    {
      'date': '2023-10-25',
      'description': 'Cashback Received',
      'amount': 100.0,
      'type': 'credit',
    },
    {
      'date': '2023-10-24',
      'description': 'Credit Card Payment',
      'amount': -5000.0,
      'type': 'debit',
    },
    {
      'date': '2023-10-23',
      'description': 'CRED Pay',
      'amount': -500.0,
      'type': 'debit',
    },
    {
      'date': '2023-10-22',
      'description': 'Reward Redemption',
      'amount': -200.0,
      'type': 'debit',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Use DateFormat for consistent date display
    final dateFormat = DateFormat('MMM dd, yyyy'); // Example: Oct 26, 2023
    // Use NumberFormat for currency display
    final currencyFormat = NumberFormat.currency(
      locale: 'en_IN', // Indian Rupees locale
      symbol: '₹ ', // Rupee symbol
      decimalDigits: 2,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryText),
          onPressed: () {
            CustomRouteAnimation.popWithAnimation(context);
          },
        ),
        title: const Text(
          'All Transactions',
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          // Determine amount color based on transaction type
          Color amountColor =
              transaction['type'] == 'credit'
                  ? AppColors.accent
                  : Colors.redAccent; // Green for credit, Red for debit
          String amountSign = transaction['type'] == 'credit' ? '+ ' : '- ';

          return Card(
            color: AppColors.card,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                transaction['type'] == 'credit'
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color: amountColor ?? AppColors.secondaryText,
              ),
              title: Text(
                transaction['description'] ??
                    'No Description', // Safely access description, provide default
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                transaction['date'] !=
                        null // Check if date is not null before parsing
                    ? dateFormat.format(DateTime.parse(transaction['date']!))
                    : 'Invalid Date', // Provide fallback text
                style: const TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 12,
                ),
              ),
              trailing: Text(
                '$amountSign${currencyFormat.format((transaction['amount'] as double? ?? 0.0).abs())}',
                style: TextStyle(
                  color: amountColor ?? AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // TODO: Navigate to transaction details screen
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
