import 'package:flutter/material.dart';
import './widgets/navbar.dart'; // Import the common navbar
import './pages/homepage.dart';
import './pages/about.dart';
import './pages/services.dart';
import './pages/contact.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(), // Start with the Homepage
  ));
}
