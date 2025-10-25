import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/user_detail_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/userDetails': (context) => const UserDetailScreen(),
        '/camera': (context) => const CameraScreen(),
        '/location': (context) => const LocationScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}