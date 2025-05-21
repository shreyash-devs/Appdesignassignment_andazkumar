import 'package:flutter/material.dart';
import 'package:speedometer_chart/speedometer_chart.dart';
import '../core/theme.dart';
import '../widgets/section_title.dart';
import '../core/route_animation.dart';

class CreditScoreScreen extends StatelessWidget {
  const CreditScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Basic dummy data for demonstration
    const int creditScore = 757;
    const String scoreCategory = 'Good'; // Example category

    // Determine the color gradient based on the score range
    List<Color> gaugeColors;
    if (creditScore < 600) {
      gaugeColors = [Colors.red, Colors.orange];
    } else if (creditScore < 750) {
      gaugeColors = [Colors.orange, Colors.yellow];
    } else {
      gaugeColors = [Colors.yellow, AppColors.accent];
    }

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
          'Credit Score',
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
            // Credit Score Gauge using speedometer_chart
            Center(
              child: SpeedometerChart(
                dimension: 250, // Size of the gauge
                minValue: 300, // Minimum possible credit score
                maxValue: 900, // Maximum possible credit score
                value: creditScore.toDouble(), // Current credit score
                graphColor: gaugeColors, // Color gradient
                pointerColor: AppColors.primaryText, // Pointer color
                valueWidget: Text(
                  '$creditScore',
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text(
                  scoreCategory,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 16,
                  ),
                ),
                titleMargin: 0, // Adjust margin if needed
                animationDuration: 1000, // Animation duration in milliseconds
              ),
            ),
            const SizedBox(height: 30),
            // Other Details Section
            const SectionTitle(title: 'OTHER DETAILS'),
            const SizedBox(height: 10),
            Text(
              '- Factors affecting your score...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '- Tips to improve your score...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            // Card Usage Details Section
            const SectionTitle(title: 'CARD USAGE DETAILS'),
            const SizedBox(height: 10),
            // Placeholder for list of cards
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for the inner list
              itemCount: 3, // Example: 3 placeholder cards
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: AppColors.primaryText,
                  ),
                  title: Text(
                    'Card Ending **** 123${index + 1}',
                    style: TextStyle(color: AppColors.primaryText),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.secondaryText,
                    size: 16,
                  ),
                  onTap: () {
                    // TODO: Navigate to card details screen
                  },
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
