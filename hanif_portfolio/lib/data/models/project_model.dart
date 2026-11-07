import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String tagLine;
  final String description;
  final List<String> techStack;
  final List<String> highlights;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? liveUrl;
  final String? imageUrl;
  final String category;
  final String? impactMetric;
  final List<Color>? gradientColors;

  const ProjectModel({
    required this.title,
    required this.tagLine,
    required this.description,
    required this.techStack,
    required this.highlights,
    this.appStoreUrl,
    this.playStoreUrl,
    this.liveUrl,
    this.imageUrl,
    this.category = 'Mobile',
    this.impactMetric,
    this.gradientColors,
  });
}
