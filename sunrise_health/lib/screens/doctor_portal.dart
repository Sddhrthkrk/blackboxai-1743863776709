import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';
import 'package:sunrise_health/screens/patient_detail_screen.dart';

class DoctorPortal extends ConsumerWidget {
  const DoctorPortal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final doctorName = user?.name ?? 'Doctor';
    final specialization = user?.specialization ?? 'Specialist';

    // Mock data for demo purposes
    final List<Map<String, dynamic>> appointments = [
      {
        'patient': 'John Smith',
        'time': '9:00 AM',
        'date': 'Today',
        'reason': 'Follow-up',
        'status': 'Confirmed'
      },
      {
        'patient': 'Sarah Johnson',
        'time': '10:30 AM',
        'date': 'Today',
        'reason': 'Annual Checkup',
        'status': 'Confirmed'
      },
      {
        'patient': 'Michael Brown',
        'time': '2:00 PM',
        'date': 'Tomorrow',
        'reason': 'New Patient',
        'status': 'Pending'
      },
    ];

    final List<Map<String, dynamic>> labRequests = [
      {
        'patient': 'John Smith',
        'test': 'Complete Blood Count',
        'date': '2023-11-15',
        'status': 'Results Ready'
      },
      {
        'patient': 'Emma Wilson',
        'test': 'Lipid Panel',
        'date': '2023-11-16',
        'status': 'Processing'
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dr. $doctorName - $specialization'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.schedule), text: 'Schedule'),
              Tab(icon: Icon(Icons.people), text: 'Patients'),
              Tab(icon: Icon(Icons.lab_profile), text: 'Lab Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Schedule Tab
            ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(appointment['patient']),
                    subtitle: Text(
                        '${appointment['date']} at ${appointment['time']}\nReason: ${appointment['reason']}'),
                    trailing: Chip(
                      label: Text(appointment['status']),
                      backgroundColor: appointment['status'] == 'Confirmed'
                          ? Colors.green[100]
                          : Colors.orange[100],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientDetailScreen(
                            patientName: appointment['patient'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            // Patients Tab
            ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(appointment['patient']),
                    subtitle: Text('Last visit: ${appointment['date']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.medical_services),
                      onPressed: () {
                        // Navigate to prescription screen
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientDetailScreen(
                            patientName: appointment['patient'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            // Lab Requests Tab
            ListView.builder(
              itemCount: labRequests.length,
              itemBuilder: (context, index) {
                final request = labRequests[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.lab_profile),
                    title: Text(request['patient']),
                    subtitle: Text(
                        'Test: ${request['test']}\nDate: ${request['date']}'),
                    trailing: Chip(
                      label: Text(request['status']),
                      backgroundColor: request['status'] == 'Results Ready'
                          ? Colors.green[100]
                          : Colors.orange[100],
                    ),
                    onTap: () {
                      // View lab report details
                    },
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add new lab request
          },
          child: const Icon(Icons.add),
          tooltip: 'Add Lab Request',
        ),
      ),
    );
  }
}