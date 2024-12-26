import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the common navbar

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Remove const here
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
