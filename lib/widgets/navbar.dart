import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/about.dart';
import '../pages/homepage.dart';
import '../pages/contact.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to check screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const Homepage(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: Text(
          'Ksatria Rental',
          style: GoogleFonts.ubuntu(
            fontSize: 22,
            color: Color.fromRGBO(
                79, 74, 69, 1), // Alpha value should be 1 for full opacity
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(237, 125, 49, 100),
      leading: null, // Remove the back button by setting leading to null
      actions: [
        // If screen width is less than 600px, show menu icon
        if (screenWidth < 900)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 60, 0, 0),
                items: [
                  PopupMenuItem(
                    child: Text(
                      'Services',
                      style: GoogleFonts.ubuntu(
                          fontSize: 22,
                          color: Color.fromRGBO(79, 74, 69, 1),
                          fontWeight: FontWeight.w200),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const Homepage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: Text(
                      'About',
                      style: GoogleFonts.ubuntu(
                          fontSize: 22,
                          color: Color.fromRGBO(79, 74, 69, 1),
                          fontWeight: FontWeight.w200),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const AboutPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Credits',
                      style: GoogleFonts.ubuntu(
                          fontSize: 22,
                          color: Color.fromRGBO(79, 74, 69, 1),
                          fontWeight: FontWeight.w200),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const ContactPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            color: Colors.white,
          )
        // If screen width is more than 600px, show a row of navigation buttons
        else
          Row(
            children: [
              navButton(context, 'Services', const Homepage()),
              navButton(context, 'About', const AboutPage()),
              navButton(context, 'Credits', const ContactPage()),
            ],
          ),
      ],
    );
  }

  // Custom method for creating navigation buttons
  Widget navButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => page,
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: Text(
          text,
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Define preferred size
}
