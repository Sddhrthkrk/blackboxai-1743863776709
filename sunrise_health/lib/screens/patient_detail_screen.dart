import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';

class PatientDetailScreen extends ConsumerWidget {
  final String patientName;

  const PatientDetailScreen({super.key, required this.patientName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock patient data for demo
    final patientData = {
      'name': patientName,
      'age': '45',
      'gender': 'Male',
      'bloodType': 'A+',
      'allergies': 'Penicillin, Pollen',
      'conditions': 'Hypertension, Type 2 Diabetes',
      'lastVisit': '2023-11-10',
      'nextAppointment': '2023-12-15 at 10:30 AM',
    };

    // Mock medical history
    final List<Map<String, String>> medicalHistory = [
      {'date': '2023-11-10', 'diagnosis': 'Hypertension follow-up', 'doctor': 'Dr. Smith'},
      {'date': '2023-09-15', 'diagnosis': 'Annual physical exam', 'doctor': 'Dr. Johnson'},
      {'date': '2023-06-20', 'diagnosis': 'Diabetes management', 'doctor': 'Dr. Smith'},
    ];

    // Mock lab results
    final List<Map<String, String>> labResults = [
      {'test': 'Complete Blood Count', 'date': '2023-11-08', 'result': 'Normal'},
      {'test': 'Lipid Panel', 'date': '2023-09-10', 'result': 'High Cholesterol'},
      {'test': 'A1C Test', 'date': '2023-06-15', 'result': '6.8%'},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(patientName),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info), text: 'Info'),
              Tab(icon: Icon(Icons.history), text: 'History'),
              Tab(icon: Icon(Icons.lab_profile), text: 'Labs'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Patient Info Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard('Basic Information', [
                    _buildInfoRow('Age', patientData['age']!),
                    _buildInfoRow('Gender', patientData['gender']!),
                    _buildInfoRow('Blood Type', patientData['bloodType']!),
                  ]),
                  const SizedBox(height: 16),
                  _buildInfoCard('Medical Information', [
                    _buildInfoRow('Allergies', patientData['allergies']!),
                    _buildInfoRow('Conditions', patientData['conditions']!),
                  ]),
                  const SizedBox(height: 16),
                  _buildInfoCard('Appointments', [
                    _buildInfoRow('Last Visit', patientData['lastVisit']!),
                    _buildInfoRow('Next Appointment', patientData['nextAppointment']!),
                  ]),
                ],
              ),
            ),

            // Medical History Tab
            ListView.builder(
              itemCount: medicalHistory.length,
              itemBuilder: (context, index) {
                final entry = medicalHistory[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(entry['diagnosis']!),
                    subtitle: Text('${entry['date']} - ${entry['doctor']}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // View detailed visit notes
                    },
                  ),
                );
              },
            ),

            // Lab Results Tab
            ListView.builder(
              itemCount: labResults.length,
              itemBuilder: (context, index) {
                final result = labResults[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(result['test']!),
                    subtitle: Text(result['date']!),
                    trailing: Chip(
                      label: Text(
                        result['result']!,
                        style: TextStyle(
                          color: result['result'] == 'Normal'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      backgroundColor: result['result'] == 'Normal'
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
            // Add new prescription or lab request
          },
          child: const Icon(Icons.add),
          tooltip: 'Add New Record',
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}