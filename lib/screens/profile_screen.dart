import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/user_profile.dart';
import '../widgets/profile_header.dart';
import '../widgets/cred_garage_card.dart';
import '../widgets/profile_list_item.dart';
import '../widgets/section_title.dart';
import '../screens/credit_score_screen.dart';
import '../screens/bank_balance_screen.dart';
import '../screens/cred_garage_screen.dart';
import '../screens/all_transactions_screen.dart';
import '../screens/refer_and_earn_screen.dart';
import '../core/route_animation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserProfile(
      name: 'andaz Kumar',
      memberSince: 'Dec, 2020',
      avatarUrl: 'assets/profile_placeholder.jpg',
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryText),
          onPressed: () {},
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.divider),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                foregroundColor: AppColors.secondaryText,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.support_agent,
                size: 18,
                color: AppColors.secondaryText,
              ),
              label: const Text(
                'support',
                style: TextStyle(color: AppColors.secondaryText),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(user: user),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CustomRouteAnimation.slideUpRoute(const CredGarageScreen()),
                );
              },
              child: const CredGarageCard(),
            ),
            const Divider(color: AppColors.divider),
            ProfileListItem(
              icon: Icons.credit_score,
              title: 'credit score',
              value: '757',
              highlight: 'REFRESH AVAILABLE',
              onTap: () {
                Navigator.push(
                  context,
                  CustomRouteAnimation.slideUpRoute(const CreditScoreScreen()),
                );
              },
            ),
            const Divider(color: AppColors.divider),
            ProfileListItem(
              icon: Icons.currency_rupee,
              title: 'lifetime cashback',
              value: '₹3',
              onTap: () {},
            ),
            const Divider(color: AppColors.divider),
            ProfileListItem(
              icon: Icons.account_balance_wallet,
              title: 'bank balance',
              value: 'check',
              onTap: () {
                Navigator.push(
                  context,
                  CustomRouteAnimation.slideUpRoute(const BankBalanceScreen()),
                );
              },
            ),
            const Divider(color: AppColors.divider),
            const SectionTitle(title: 'YOUR REWARDS & BENEFITS'),
            ListTile(
              title: const Text(
                'cashback balance',
                style: TextStyle(color: AppColors.primaryText),
              ),
              subtitle: const Text(
                '₹0',
                style: TextStyle(color: AppColors.secondaryText),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryText,
                size: 16,
              ),
              onTap: () {},
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(color: AppColors.divider),
            ListTile(
              title: const Text(
                'coins',
                style: TextStyle(color: AppColors.primaryText),
              ),
              subtitle: const Text(
                '26,46,583',
                style: TextStyle(color: AppColors.secondaryText),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryText,
                size: 16,
              ),
              onTap: () {},
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(color: AppColors.divider),
            ListTile(
              title: const Text(
                'win upto Rs 1000',
                style: TextStyle(color: AppColors.primaryText),
              ),
              subtitle: const Text(
                'refer and earn',
                style: TextStyle(color: AppColors.secondaryText),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryText,
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  CustomRouteAnimation.slideUpRoute(const ReferAndEarnScreen()),
                );
              },
              contentPadding: EdgeInsets.zero,
            ),
            const SectionTitle(title: 'TRANSACTIONS & SUPPORT'),
            ListTile(
              title: const Text(
                'all transactions',
                style: TextStyle(color: AppColors.primaryText),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryText,
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  CustomRouteAnimation.slideUpRoute(
                    const AllTransactionsScreen(),
                  ),
                );
              },
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
