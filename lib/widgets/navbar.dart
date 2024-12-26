import 'package:flutter/material.dart';
import '../pages/about.dart';
import '../pages/homepage.dart';
import '../pages/contact.dart';
import '../pages/services.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to check screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: const Text('Ksatria Rental'),
      backgroundColor: Colors.orangeAccent,
      titleTextStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      leading: null, // Remove the back button by setting leading to null
      actions: [
        // If screen width is less than 600px, show menu icon
        if (screenWidth < 600)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 60, 0, 0),
                items: [
                  PopupMenuItem(
                    child: const Text('Home'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                        (route) => false, // Remove all routes from stack
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('About'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()),
                        (route) => false, // Remove all routes from stack
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Services'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServicesPage()),
                        (route) => false, // Remove all routes from stack
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Contact'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactPage()),
                        (route) => false, // Remove all routes from stack
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
              navButton(context, 'Home', const Homepage()),
              navButton(context, 'About', const AboutPage()),
              navButton(context, 'Services', const ServicesPage()),
              navButton(context, 'Contact', const ContactPage()),
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => page),
            (route) => false, // Remove all routes from stack
          );
        },
        child: Text(
          text,
          style: const TextStyle(
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
