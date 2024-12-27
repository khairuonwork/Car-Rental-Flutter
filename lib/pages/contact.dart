import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the common navbar
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // No need for const here, as Navbar is a dynamic widget
      backgroundColor: Color.fromRGBO(246, 241, 238, 1),
      body: Center(
        // Wrap Column in a Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20.0)),
            Text(
              'Kelompok 4 - Car Rental Flutter Website',
              style: GoogleFonts.ubuntu(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Abizar Firmansyah (1203623038)',
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
            ),
            Text(
              'David Calvyn (1203623023)',
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
            ),
            Text(
              'Julizar Natansyah (1203623017)',
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
            ),
            Text(
              'Ni Matul Maula (1203623032)',
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
            ),
            Text(
              'Ryanne Renaningtyas (1203623001)',
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
