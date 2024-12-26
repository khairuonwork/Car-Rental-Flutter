import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the common navbar

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Variables to store the selected car type, car, and date
  String? _carType = 'Manual';
  String? _selectedCar;
  DateTime _selectedDate = DateTime.now();

  // List of available cars
  final List<String> manualCars = [
    'Toyota Corolla',
    'Honda Civic',
    'Ford Focus',
  ];

  final List<String> automaticCars = [
    'Honda Accord',
    'BMW 3 Series',
    'Tesla Model 3',
  ];

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  // Placeholder function to calculate the rental cost based on car type
  double _calculateCost() {
    if (_carType == 'Manual') {
      return 50.0; // Example price for manual cars per day
    } else {
      return 80.0; // Example price for automatic cars per day
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine the list of cars based on the selected car type
    final List<String> availableCars =
        _carType == 'Manual' ? manualCars : automaticCars;

    return Scaffold(
      appBar: Navbar(),
      backgroundColor: Color.fromRGBO(246, 241, 238, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Type Selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Select Car Type',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: Text('Manual'),
                  selected: _carType == 'Manual',
                  onSelected: (selected) {
                    setState(() {
                      _carType = 'Manual';
                      _selectedCar =
                          null; // Reset selected car when type changes
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Automatic'),
                  selected: _carType == 'Automatic',
                  onSelected: (selected) {
                    setState(() {
                      _carType = 'Automatic';
                      _selectedCar =
                          null; // Reset selected car when type changes
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Available Cars List
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Available Cars',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
            ),
            Column(
              children: availableCars
                  .map((car) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            car,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(79, 74, 69, 1),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedCar = car; // Set the selected car
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Rental Date Picker
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Select Pickup Date',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
            ),
            ListTile(
              title: Text(
                '${_selectedDate.toLocal()}'.split(' ')[0],
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Placeholder for submitting the rental form
                setState(() {
                  // Triggering state change to show the bill
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(79, 74, 69, 1),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              ),
              child: Text(
                'Submit Rental',
                style: TextStyle(fontSize: 18),
              ),
            ),

            // Bill Section
            if (_selectedCar != null)
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bill Summary',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(79, 74, 69, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Car Type: $_carType',
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(79, 74, 69, 1)),
                    ),
                    Text(
                      'Car: $_selectedCar',
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(79, 74, 69, 1)),
                    ),
                    Text(
                      'Pickup Date: ${_selectedDate.toLocal()}'.split(' ')[0],
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(79, 74, 69, 1)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Total Cost: \$${_calculateCost().toStringAsFixed(2)} per day',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(79, 74, 69, 1)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
