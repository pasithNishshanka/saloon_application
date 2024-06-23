import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final String service;

  const Booking({Key? key, required this.service}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime _selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  TimeOfDay _selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 31, 32),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 55.0,),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            const Text(
              "Let's the\nbegin journey",
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
            SizedBox(height: 20.0),

            Expanded(
              child: SingleChildScrollView( // Scroll for the image
                child: Column( // Wrap widgets in a Column
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assest/images/discount.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      widget.service,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 106, 106),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      child: Column(
                        children: [
                          const Text(
                            "Set a Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 251, 250, 250),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 106, 106),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      child: Column(
                        children: [
                          const Text(
                            "Set a Time",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _selectTime(context);
                                },
                                child: Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "${_selectedTime.format(context)}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 251, 250, 250),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 251, 250, 248),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 5, 5),
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}