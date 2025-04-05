import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String id;
  final String username;
  final String role; // 'doctor', 'patient', 'admin'
  final String name;
  final String? specialization;
  final bool isVerified;

  User({
    required this.id,
    required this.username,
    required this.role,
    required this.name,
    this.specialization,
    this.isVerified = false,
  });
}

final userProvider = StateProvider<User?>((ref) => null);