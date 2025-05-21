import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../core/route_animation.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  // Dummy static data
  final String _name = 'andaz Kumar';
  final String _phone = '+91 98765 43210'; // Example
  final String _email = 'andaz.kumar@example.com'; // Example
  final String _memberSince = 'Dec, 2020'; // Example

  @override
  Widget build(BuildContext context) {
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
          'Profile Details', // Changed title to reflect static view
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          children: [
            // Profile Picture Section (Static)
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                'assets/profile_placeholder.jpg',
              ), // Use local asset
            ),
            const SizedBox(height: 20),
            Text(
              _name,
              style: const TextStyle(
                color: AppColors.primaryText,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Member since ' + _memberSince,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),

            // Static Information Fields
            _buildInfoRow('Phone Number', _phone, Icons.phone),
            const SizedBox(height: 16),
            _buildInfoRow('Email', _email, Icons.email),
            const SizedBox(height: 16),

            // Add more static info rows as needed (e.g., Date of Birth, Address)
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper method to build static info rows
  Widget _buildInfoRow(String labelText, String valueText, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.card, // Background color for the info row
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondaryText, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  valueText,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
