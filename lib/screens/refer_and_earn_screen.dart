import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../core/route_animation.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.primaryText),
          onPressed: () {
            CustomRouteAnimation.popWithAnimation(context);
          },
        ),
        title: const Text(
          'Referrals - Whats New?',
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                style: TextStyle(color: AppColors.primaryText),
                decoration: InputDecoration(
                  hintText: 'search your question',
                  hintStyle: TextStyle(color: AppColors.secondaryText),
                  icon: Icon(Icons.search, color: AppColors.secondaryText),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildQuestionAnswer(
              context,
              'What is the CRED referral program?',
              'CREDs new referral program lets you invite friends to join CRED and get rewarded for it! Once your friend has registered successfully and has made their first payment on CRED, you and your...',
            ),
            const SizedBox(height: 20),

            _buildQuestionAnswer(
              context,
              'How can I refer CRED to my friends?',
              'You just need to do the following to participate: - Click \'control\' located at the top-right corner on your home page - Click on the button labelled \'Refer now &...',
            ),
            const SizedBox(height: 20),

            _buildQuestionAnswer(
              context,
              'What are the benefits?',
              'If your friends get accepted as a CRED member, and completes their first payment towards their credit cards on CRED, you receive 10 gems which can be redeemed for rewards...',
            ),
            const SizedBox(height: 20),

            _buildQuestionAnswer(
              context,
              'What if I already have a CRED referral link from before May 21st?',
              'You may be invited to participate in new referral campaigns from time to time from CRED. As of now, any referral link that you have received before or...',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswer(
    BuildContext context,
    String question,
    String answer,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: const TextStyle(color: AppColors.secondaryText, fontSize: 14),
        ),
      ],
    );
  }
}
