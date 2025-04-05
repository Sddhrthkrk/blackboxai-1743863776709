import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_health/providers/user_provider.dart';
import 'package:sunrise_health/screens/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: SunriseHealth()));
}

class SunriseHealth extends ConsumerWidget {
  const SunriseHealth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sunrise Health Center',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: const Color(0xFF1976D2),
          secondary: const Color(0xFF42A5F5),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}