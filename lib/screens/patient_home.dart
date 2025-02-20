import 'package:flutter/material.dart';
import '../services/bluetooth_service.dart';
import '../services/ai_service.dart';

class PatientHomeScreen extends StatefulWidget {
  @override
  _PatientHomeScreenState createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  String ecgData = '';
  String diagnosis = 'No diagnosis yet';

  @override
  void initState() {
    super.initState();
    // Start Bluetooth connection to receive live ECG data.
    BluetoothService().connectToSensor((data) {
      setState(() {
        ecgData = data;
      });
    });
  }

  void analyzeECG() async {
    String result = await AIService().analyzeECG(ecgData);
    setState(() {
      diagnosis = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Home')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Live ECG Data:'),
            SizedBox(height: 10),
            Text(ecgData, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: analyzeECG, child: Text('Analyze ECG')),
            SizedBox(height: 20),
            Text('Diagnosis: $diagnosis', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
