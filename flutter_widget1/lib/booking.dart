import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_widget1/home.dart';
import 'package:flutter_widget1/room.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _bookingKey = GlobalKey<FormState>();

  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlCity = TextEditingController();

  void _showDialog(Map<String, String> formData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Form Confirmed'),
          content: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: formData.entries
                  .map((entry) => Text('${entry.key}: ${entry.value}'))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "OK");
                  Navigator.pop(context, "OK");
                },
                child: Text("OK"),
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                  backgroundColor: Color(0xFFe63946),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 14),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Booking Form",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _bookingKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: ctrlName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[a-zA-Z ]')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Full name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: ctrlEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return !EmailValidator.validate(value.toString())
                          ? "Email invalid"
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: ctrlPhone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.phone_android),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      } else if (value.length < 8 || value.length > 13) {
                        return "Phone number must be between 8 - 13 digits";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: ctrlCity,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.apartment),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[a-zA-Z ]')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "City is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_bookingKey.currentState != null &&
                          _bookingKey.currentState!.validate()) {
                        final formData = {
                          "Nama": ctrlName.text,
                          "Email": ctrlEmail.text,
                          "Telefon": ctrlPhone.text,
                          "City": ctrlCity.text,
                        };
                        _showDialog(formData);
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text("Book Now"),
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
