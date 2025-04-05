import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';
import 'package:sunrise_health/screens/doctor_booking_screen.dart';
import 'package:sunrise_health/screens/lab_request_screen.dart';
import 'package:sunrise_health/screens/doctor_portal.dart';
import 'package:sunrise_health/screens/patient_portal.dart';
import 'package:sunrise_health/screens/admin_portal.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final role = user?.role ?? 'patient';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunrise Health Center'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(userProvider.notifier).state = null,
          ),
        ],
      ),
      body: _buildRoleContent(role),
      bottomNavigationBar: _buildBottomNav(role),
    );
  }

  Widget _buildRoleContent(String role) {
    switch (role) {
      case 'doctor':
        return const DoctorPortal();
      case 'admin':
        return const AdminPortal();
      default:
        return const PatientPortal();
    }
  }

  Widget _buildBottomNav(String role) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        if (role == 'patient')
          const BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Book Appointment',
          ),
        if (role == 'patient')
          const BottomNavigationBarItem(
            icon: Icon(Icons.lab_profile),
            label: 'Lab Tests',
          ),
        if (role == 'doctor')
          const BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
        if (role == 'admin')
          const BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
      ],
      currentIndex: 0,
      onTap: (index) {
        // Navigation logic would go here
      },
    );
  }
}