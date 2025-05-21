import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/section_title.dart';
import '../core/route_animation.dart';

class CredGarageScreen extends StatelessWidget {
  const CredGarageScreen({Key? key}) : super(key: key);

  // Dummy list of vehicles
  final List<Map<String, String>> vehicles = const [
    {
      'type': 'bike',
      'make': 'Honda',
      'model': 'Activa 125',
      'registration': 'MH 12 AB 1234',
      'insurance_expiry': '2024-12-31',
    },
    {
      'type': 'car',
      'make': 'Maruti Suzuki',
      'model': 'Swift',
      'registration': 'MH 01 CD 5678',
      'insurance_expiry': '2025-06-15',
    },
  ];

  IconData _getVehicleIcon(String type) {
    if (type == 'car') {
      return Icons.directions_car;
    } else if (type == 'bike') {
      return Icons.directions_bike;
    } else {
      return Icons.directions_car; // Default to car icon
    }
  }

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
          'CRED Garage',
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
            const SectionTitle(title: 'MY VEHICLES'),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return Card(
                  color: AppColors.card,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          _getVehicleIcon(vehicle['type']!),
                          color: AppColors.secondaryText, // Icon color
                          size: 30,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${vehicle['make']} ${vehicle['model']}',
                                style: const TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Reg. No: ${vehicle['registration']}',
                                style: const TextStyle(
                                  color: AppColors.secondaryText,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Insurance Expiry: ${vehicle['insurance_expiry']}',
                                style: TextStyle(
                                  color:
                                      DateTime.parse(
                                            vehicle['insurance_expiry']!,
                                          ).isBefore(
                                            DateTime.now().add(
                                              const Duration(days: 30),
                                            ),
                                          )
                                          ? Colors.orangeAccent
                                          : AppColors
                                              .secondaryText, // Highlight if expiring soon
                                  fontSize: 14,
                                ),
                              ),
                              // TODO: Add more vehicle details like PUC, Service Reminders, etc.
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.secondaryText,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            const SectionTitle(title: 'DOCUMENTS & REMINDERS'),
            const SizedBox(height: 10),
            Card(
              color: AppColors.card,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.description,
                        color: AppColors.secondaryText,
                      ),
                      title: Text(
                        'Vehicle Documents',
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondaryText,
                        size: 16,
                      ),
                      onTap: () {
                        /* TODO: Navigate to documents screen */
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    Divider(color: AppColors.divider),
                    ListTile(
                      leading: Icon(
                        Icons.notifications_active,
                        color: AppColors.secondaryText,
                      ),
                      title: Text(
                        'Service Reminders',
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondaryText,
                        size: 16,
                      ),
                      onTap: () {
                        /* TODO: Navigate to reminders screen */
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: AppColors.card,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.accent,
                ),
                title: const Text(
                  'Add New Vehicle',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.secondaryText,
                  size: 16,
                ),
                onTap: () {
                  // TODO: Implement add new vehicle functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
