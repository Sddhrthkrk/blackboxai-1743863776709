import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';

class AdminPortal extends ConsumerWidget {
  const AdminPortal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock data for demo
    final List<Map<String, dynamic>> users = [
      {
        'name': 'Dr. Smith',
        'email': 'dr.smith@sunrise.com',
        'role': 'Doctor',
        'status': 'Active',
        'lastLogin': '2023-11-20'
      },
      {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'role': 'Patient',
        'status': 'Active',
        'lastLogin': '2023-11-18'
      },
      {
        'name': 'Admin User',
        'email': 'admin@sunrise.com',
        'role': 'Admin',
        'status': 'Active',
        'lastLogin': '2023-11-21'
      },
    ];

    final List<Map<String, dynamic>> allAppointments = [
      {
        'patient': 'John Doe',
        'doctor': 'Dr. Smith',
        'date': '2023-11-22',
        'time': '9:00 AM',
        'status': 'Confirmed'
      },
      {
        'patient': 'Sarah Johnson',
        'doctor': 'Dr. Williams',
        'date': '2023-11-22',
        'time': '10:30 AM',
        'status': 'Confirmed'
      },
      {
        'patient': 'Michael Brown',
        'doctor': 'Dr. Johnson',
        'date': '2023-11-23',
        'time': '2:00 PM',
        'status': 'Pending'
      },
    ];

    final List<Map<String, dynamic>> allLabRequests = [
      {
        'patient': 'John Doe',
        'test': 'Complete Blood Count',
        'date': '2023-11-20',
        'status': 'Processing'
      },
      {
        'patient': 'Emma Wilson',
        'test': 'Lipid Panel',
        'date': '2023-11-19',
        'status': 'Completed'
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Administrator Portal'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.people), text: 'Users'),
              Tab(icon: Icon(Icons.calendar_today), text: 'Appointments'),
              Tab(icon: Icon(Icons.lab_profile), text: 'Lab Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Users Tab
            ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(user['name'].toString().substring(0, 1)),
                    ),
                    title: Text(user['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user['email']),
                        Text('${user['role']} - Last login: ${user['lastLogin']}'),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(user['status']),
                      backgroundColor: user['status'] == 'Active'
                          ? Colors.green[100]
                          : Colors.grey[300],
                    ),
                    onTap: () {
                      // Edit user
                    },
                  ),
                );
              },
            ),

            // Appointments Tab
            ListView.builder(
              itemCount: allAppointments.length,
              itemBuilder: (context, index) {
                final appointment = allAppointments[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text('${appointment['patient']} with ${appointment['doctor']}'),
                    subtitle: Text('${appointment['date']} at ${appointment['time']}'),
                    trailing: Chip(
                      label: Text(appointment['status']),
                      backgroundColor: appointment['status'] == 'Confirmed'
                          ? Colors.green[100]
                          : Colors.orange[100],
                    ),
                    onTap: () {
                      // Edit appointment
                    },
                  ),
                );
              },
            ),

            // Lab Requests Tab
            ListView.builder(
              itemCount: allLabRequests.length,
              itemBuilder: (context, index) {
                final request = allLabRequests[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.lab_profile),
                    title: Text(request['patient']),
                    subtitle: Text('${request['test']} - ${request['date']}'),
                    trailing: Chip(
                      label: Text(request['status']),
                      backgroundColor: request['status'] == 'Completed'
                          ? Colors.green[100]
                          : Colors.orange[100],
                    ),
                    onTap: () {
                      // View/update lab request
                    },
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add new user/appointment
          },
          child: const Icon(Icons.add),
          tooltip: 'Add New',
        ),
      ),
    );
  }
}