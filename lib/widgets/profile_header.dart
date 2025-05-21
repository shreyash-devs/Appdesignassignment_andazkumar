import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../core/theme.dart';
import '../screens/edit_profile_screen.dart';
import '../core/route_animation.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile user;
  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage('assets/profile_placeholder.jpg'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                'member since ${user.memberSince}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CustomRouteAnimation.slideUpRoute(const EditProfileScreen()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.divider),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.edit,
              size: 20,
              color: AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
