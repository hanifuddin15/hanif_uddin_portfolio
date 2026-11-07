class ProjectModel {
  final String title;
  final String tagLine;
  final String description;
  final List<String> techStack;
  final List<String> highlights;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? liveUrl;

  const ProjectModel({
    required this.title,
    required this.tagLine,
    required this.description,
    required this.techStack,
    required this.highlights,
    this.appStoreUrl,
    this.playStoreUrl,
    this.liveUrl,
  });
}
