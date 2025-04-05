import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';

class PatientPortal extends ConsumerWidget {
  const PatientPortal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final patientName = user?.name ?? 'Patient';

    // Mock data for demo
    final List<Map<String, dynamic>> appointments = [
      {
        'doctor': 'Dr. Smith',
        'date': '2023-12-15',
        'time': '10:30 AM',
        'type': 'Follow-up',
        'status': 'Confirmed'
      },
      {
        'doctor': 'Dr. Johnson',
        'date': '2023-12-20',
        'time': '2:00 PM',
        'type': 'Annual Checkup',
        'status': 'Pending'
      },
    ];

    final List<Map<String, dynamic>> labReports = [
      {
        'test': 'Complete Blood Count',
        'date': '2023-11-15',
        'status': 'Completed',
        'result': 'Normal'
      },
      {
        'test': 'Lipid Panel',
        'date': '2023-09-10',
        'status': 'Completed',
        'result': 'High Cholesterol'
      },
    ];

    final List<Map<String, dynamic>> medications = [
      {
        'name': 'Lisinopril',
        'dose': '10mg',
        'frequency': 'Once daily',
        'prescribed': 'Dr. Smith',
        'date': '2023-11-10'
      },
      {
        'name': 'Metformin',
        'dose': '500mg',
        'frequency': 'Twice daily',
        'prescribed': 'Dr. Johnson',
        'date': '2023-09-15'
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$patientName Portal'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today), text: 'Appointments'),
              Tab(icon: Icon(Icons.medical_services), text: 'Medications'),
              Tab(icon: Icon(Icons.lab_profile), text: 'Lab Reports'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Appointments Tab
            ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text('${appointment['doctor']} - ${appointment['type']}'),
                    subtitle: Text('${appointment['date']} at ${appointment['time']}'),
                    trailing: Chip(
                      label: Text(appointment['status']),
                      backgroundColor: appointment['status'] == 'Confirmed'
                          ? Colors.green[100]
                          : Colors.orange[100],
                    ),
                  ),
                );
              },
            ),

            // Medications Tab
            ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.medical_services),
                    title: Text(medication['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${medication['dose']} - ${medication['frequency']}'),
                        Text('Prescribed by ${medication['prescribed']} on ${medication['date']}'),
                      ],
                    ),
                    trailing: const Icon(Icons.info),
                  ),
                );
              },
            ),

            // Lab Reports Tab
            ListView.builder(
              itemCount: labReports.length,
              itemBuilder: (context, index) {
                final report = labReports[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.lab_profile),
                    title: Text(report['test']!),
                    subtitle: Text(report['date']!),
                    trailing: Chip(
                      label: Text(
                        report['result']!,
                        style: TextStyle(
                          color: report['result'] == 'Normal'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      backgroundColor: report['result'] == 'Normal'
                          ? Colors.green[50]
                          : Colors.red[50],
                    ),
                    onTap: () {
                      // View detailed lab report
                    },
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Book new appointment or request refill
          },
          child: const Icon(Icons.add),
          tooltip: 'New Appointment',
        ),
      ),
    );
  }
}