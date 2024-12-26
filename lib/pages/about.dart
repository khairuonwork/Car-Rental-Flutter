import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import '../widgets/navbar.dart'; // Import the common navbar

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 241, 238, 1),
      appBar: Navbar(), // Use the common Navbar widget
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add some padding and text content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'About Ksatria Rental',
                style: GoogleFonts.ubuntu(
                  // Use the Ubuntu font
                  fontSize: 22, // Set font size to 22
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Ksatria Rental is a trusted car rental service offering a wide selection of vehicles for your travel needs. '
                'We ensure that every ride is comfortable and affordable. Whether you need a car for business trips or vacations, '
                'we are here to provide you with the best options.',
                style: GoogleFonts.ubuntu(
                  // Use the Ubuntu font
                  fontSize: 16,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40), // Added bottom spacing for aesthetics
          ],
        ),
      ),
    );
  }
}
