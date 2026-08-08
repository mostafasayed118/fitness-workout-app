class NutritionModelNew {
  final String title;
  final String description;
  final String sugar;
  final String protein;
  final String fibers;
  final String fats;

  NutritionModelNew({
    this.title = '',
    this.description = '',
    this.sugar = '',
    this.protein = '',
    this.fibers = '',
    this.fats = '',
  });

  factory NutritionModelNew.fromMap(Map<String, dynamic> map) {
    // Convert and clean the response from Gemini API
    var cleanedDescription = map['description']
        .replaceAll(RegExp(r'\*|\#'), '')
        .replaceAll(RegExp(r'\s+'), '  ')
        .replaceAll(RegExp(r'\n\s+'), '\n')
        .replaceAll(RegExp(r'\n+'), '\n')
        .trim();
    return NutritionModelNew(
      title: map['title'] ?? 'Nutrition Information',
      description: cleanedDescription,
      sugar: map['sugar'] ?? '',
      protein: map['protein'] ?? '',
      fibers: map['fibers'] ?? '',
      fats: map['fats'] ?? '',
    );
  }
}
