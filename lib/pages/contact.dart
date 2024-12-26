import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the common navbar

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Remove const here
      body: const Center(
        child: Text('Contact Page Content'),
      ),
    );
  }
}
