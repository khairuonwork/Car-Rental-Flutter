import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the common navbar

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Remove const here
      body: const Center(
        child: Text('About Page Content'),
      ),
    );
  }
}
