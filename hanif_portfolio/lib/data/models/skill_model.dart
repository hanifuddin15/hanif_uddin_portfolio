class SkillModel {
  final String name;
  final String category;
  final double proficiency; // 0.0 to 1.0 (e.g., 0.95 for 95%)
  final String experience; // e.g. "3.5+ Years"
  final String level; // e.g. "Lead Architect", "Expert", "Advanced"
  final List<String> tags;
  final String description;

  const SkillModel({
    required this.name,
    required this.category,
    required this.proficiency,
    required this.experience,
    required this.level,
    this.tags = const [],
    this.description = '',
  });

  int get percentage => (proficiency * 100).round();
}
