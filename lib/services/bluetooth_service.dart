import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  BluetoothConnection? connection;

  // Connect to the HC-05 sensor. The callback is called with the data received.
  void connectToSensor(Function(String) onDataReceived) async {
    try {
      // Replace with your HC-05 device address.
      String address = "00:11:22:33:44:55";
      connection = await BluetoothConnection.toAddress(address);
      print('Connected to the sensor');

      connection!.input!
          .listen((data) {
            // Convert the incoming bytes to a String.
            String receivedData = String.fromCharCodes(data);
            onDataReceived(receivedData);
          })
          .onDone(() {
            print('Disconnected by remote request');
          });
    } catch (e) {
      print('Error connecting to sensor: $e');
    }
  }

  void disconnect() {
    connection?.dispose();
  }
}
