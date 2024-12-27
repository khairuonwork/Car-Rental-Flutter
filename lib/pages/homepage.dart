import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Import the common navbar

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Variables to store the selected car type, car, and dates
  String? _carType = 'Manual';
  String? _selectedCar;
  DateTime _pickupDate = DateTime.now();
  DateTime _deliverBackDate = DateTime.now().add(Duration(days: 1));

  // List of available cars
  final List<String> manualCars = [
    'Toyota Corolla',
    'Honda Civic',
    'Toyota Innova',
  ];

  final List<String> automaticCars = [
    'Honda Accord',
    'Toyota Avanza',
    'Daihatsu Xenia',
  ];

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context, bool isPickup) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isPickup ? _pickupDate : _deliverBackDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isPickup) {
          _pickupDate = picked;
          if (_deliverBackDate.isBefore(_pickupDate)) {
            _deliverBackDate = _pickupDate.add(Duration(days: 1));
          }
        } else {
          _deliverBackDate = picked;
        }
      });
    }
  }

  // Function to calculate the rental cost
  double _calculateCost() {
    final int days = _deliverBackDate.difference(_pickupDate).inDays + 1;
    final double pricePerDay = _carType == 'Manual' ? 300000.0 : 400000.0;
    return pricePerDay * days;
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
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
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

            // Rental Dates
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Select Dates',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Pickup Date: ${_pickupDate.toLocal()}'.split(' ')[0],
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, true),
            ),
            ListTile(
              title: Text(
                'Deliver Back Date: ${_deliverBackDate.toLocal()}'
                    .split(' ')[0],
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(79, 74, 69, 1),
                ),
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, false),
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                setState(() {});
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
                    Text('Car Type: $_carType'),
                    Text('Car: $_selectedCar'),
                    Text('Pickup Date: ${_pickupDate.toLocal()}'.split(' ')[0]),
                    Text('Deliver Back Date: ${_deliverBackDate.toLocal()}'
                        .split(' ')[0]),
                    const SizedBox(height: 20),
                    Text(
                      'Total Cost: Rp.${_calculateCost().toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
