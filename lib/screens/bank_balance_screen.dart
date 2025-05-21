import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'package:intl/intl.dart';
import '../widgets/section_title.dart';
import '../core/route_animation.dart';

class BankBalanceScreen extends StatefulWidget {
  const BankBalanceScreen({Key? key}) : super(key: key);

  @override
  _BankBalanceScreenState createState() => _BankBalanceScreenState();
}

class _BankBalanceScreenState extends State<BankBalanceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _balanceAnimation;

  // Dummy bank balance data (as a double for animation)
  final double _targetBalance = 123456.78;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    _balanceAnimation = Tween<double>(
      begin: 0.0,
      end: _targetBalance,
    ).animate(_controller);

    // Start the animation when the screen opens
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use a NumberFormat to display currency nicely
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
          'Bank Balance',
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Add spacing similar to coins screen
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.account_balance,
                  color: AppColors.secondaryText,
                  size: 40,
                ), // Bank icon
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'total balance', // Or 'account balance'
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 14,
                      ),
                    ),
                    // Animated bank balance text
                    AnimatedBuilder(
                      animation: _balanceAnimation,
                      builder: (context, child) {
                        // Format the animated value as currency
                        final formattedBalance = currencyFormat.format(
                          _balanceAnimation.value,
                        );
                        return Text(
                          formattedBalance,
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                'Roboto Mono', // Consistent with bank balance
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30), // Spacing before next section
            const SectionTitle(title: 'ACCOUNTS'),
            const SizedBox(height: 10),
            // Placeholder for list of bank accounts
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for the inner list
              itemCount: 2, // Example: 2 placeholder accounts
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.card,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.account_balance,
                      color: AppColors.primaryText,
                    ),
                    title: Text(
                      'Bank Account ${index + 1}',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Account Number: **** ${4321 + index}',
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.secondaryText,
                      size: 16,
                    ),
                    onTap: () {
                      // TODO: Navigate to account details screen
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20), // Spacing after accounts list
            const SectionTitle(title: 'TRANSACTION HISTORY (Placeholder)'),
            const SizedBox(height: 10),
            // Placeholder for transaction history list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Example: 5 placeholder transactions
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.compare_arrows,
                    color: AppColors.secondaryText,
                  ),
                  title: Text(
                    'Transaction ${index + 1}',
                    style: TextStyle(color: AppColors.primaryText),
                  ),
                  subtitle: Text(
                    'Details of transaction ${index + 1}',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                  trailing: Text(
                    '- ₹ ${100 * (index + 1)}',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
