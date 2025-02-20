import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  final String apiUrl = "https://your-ai-api-endpoint.com/analyze";

  Future<String> analyzeECG(String ecgData) async {
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"ecg_data": ecgData}),
      );
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return result['diagnosis'] ?? "No diagnosis available";
      } else {
        return "Error analyzing ECG";
      }
    } catch (e) {
      print("AI Analysis Error: $e");
      return "Error analyzing ECG";
    }
  }
}
