import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';

class LabRequestScreen extends ConsumerStatefulWidget {
  const LabRequestScreen({super.key});

  @override
  ConsumerState<LabRequestScreen> createState() => _LabRequestScreenState();
}

class _LabRequestScreenState extends ConsumerState<LabRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedTest;
  String _precisionDetails = '';
  bool _isUrgent = false;

  final Map<String, double> _testPrices = {
    'Complete Blood Count': 25.00,
    'Basic Metabolic Panel': 35.50,
    'Lipid Panel': 42.75,
    'Liver Function Test': 38.25,
    'Thyroid Test': 45.00,
    'Urinalysis': 18.50,
    'X-Ray': 75.00,
    'MRI': 250.00,
    'CT Scan': 200.00,
  };

  void _submitRequest() {
    if (_formKey.currentState!.validate() && _selectedTest != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Lab Request Submitted'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Test: $_selectedTest'),
              Text('Price: \$${_testPrices[_selectedTest!]!.toStringAsFixed(2)}'),
              if (_precisionDetails.isNotEmpty)
                Text('Special Instructions: $_precisionDetails'),
              if (_isUrgent) const Text('Status: URGENT'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Lab Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Test Type:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedTest,
                items: _testPrices.keys.map((test) {
                  return DropdownMenuItem(
                    value: test,
                    child: Text(test),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTest = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a test' : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Choose a test',
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedTest != null) ...[
                Text(
                  'Price: \$${_testPrices[_selectedTest!]!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Precision/Request Details:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter any special instructions...',
                  ),
                  onChanged: (value) => _precisionDetails = value,
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text('Mark as Urgent'),
                  value: _isUrgent,
                  onChanged: (value) {
                    setState(() {
                      _isUrgent = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitRequest,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                    child: const Text('Submit Request'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}