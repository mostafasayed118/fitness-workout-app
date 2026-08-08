import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

class GeminiServiceNew {
  final _apiKey = const String.fromEnvironment(
    'GEMINI_API_KEY',
    defaultValue: '',
  );

  Future<Map<String, dynamic>> getNutritionValues(XFile file) async {
    if (_apiKey.isEmpty) {
      throw Exception(
        'Gemini API key not configured. Set GEMINI_API_KEY environment variable.',
      );
    }
    final bytes = await file.readAsBytes();
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _apiKey);

    final prompt = TextPart(
      """Analyze this image for nutritional content with the following format: Title: {title} make new line.
          Description: {description} make new line.
          Sugar: {sugar}, Protein: {protein}, Fibers: {fibers}, Fats: {fats}.
          vitamin A: {vitamin A}, Vitamin C: {vitamin C}, Selenium: {selenium}, Magnesium: {magnesium}. 
          Format and get values as double and be sure to include units. after each value make new line.
         """,
    );

    final imagePart = DataPart('image/jpeg', bytes);

    final response = await model.generateContent([
      Content.multi([prompt, imagePart]),
    ]);

    return {
      'title': 'Nutrition Values',
      'description': response.text,
      'sugar': extractNutritionValue(response.text!, 'Sugar'),
      'protein': extractNutritionValue(response.text!, 'Protein'),
      'fibers': extractNutritionValue(response.text!, 'Fibers'),
      'fats': extractNutritionValue(response.text!, 'Fats'),
    };
  }

  String extractNutritionValue(String response, String nutrient) {
    final regex = RegExp(r'$nutrient: (\d+(\.\d+)? ) ');

    final match = regex.firstMatch(response);
    return match?.group(1) ?? '';
  }
}
