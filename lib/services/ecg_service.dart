class ECGService {
  // Example method to parse raw ECG data.
  double parseECGData(String rawData) {
    // Implement your parsing logic here.
    try {
      return double.parse(rawData.trim());
    } catch (e) {
      print("Parsing Error: $e");
      return 0.0;
    }
  }
}
