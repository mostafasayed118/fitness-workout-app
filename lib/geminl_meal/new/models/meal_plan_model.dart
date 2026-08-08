// Model for meal plans
class MealPlan {
  final String title;
  final String subtitle;
  final String description;

  MealPlan({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  // Factory method to create a MealPlan from API response
  factory MealPlan.fromApiResponse(String response) {
    // Clean up the response text
    final cleanedText = response.replaceAll(RegExp(r'[\*\#]'), '');
    // Logic to parse the cleanedText and create a MealPlan object
    return MealPlan(
      title: 'Generated Meal Plan',
      subtitle: 'Based on your input',
      description: cleanedText,
    );
  }
}
