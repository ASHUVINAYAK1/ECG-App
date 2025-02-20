import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Home')),
      body: Center(child: Text('Welcome, Doctor!')),
    );
  }
}
