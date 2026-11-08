import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanif_portfolio/data/protfolio_data.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import '../../data/models/project_model.dart';
import '../widgets/animated_reveal.dart';
import '../widgets/glass_card.dart';
import '../widgets/project_detail_modal.dart';
import '../widgets/project_mockup_widget.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedCategory = 'All';

  List<String> get _categories {
    final categories = <String>{'All'};
    for (final p in PortfolioData.projects) {
      categories.add(p.category);
    }
    return categories.toList();
  }

  List<ProjectModel> get _filteredProjects {
    if (_selectedCategory == 'All') {
      return PortfolioData.projects;
    }
    return PortfolioData.projects
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1050;
    final isTablet = width >= 680 && width < 1050;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            children: [
              const AnimatedReveal(
                child: SectionTitle(
                  preTitle: 'Production Case Studies',
                  title: 'Flagship Mobile Systems & Live Demos',
                  subtitle:
                      'Engineered to scale. Interactive case studies with live biometric architecture, sub-100ms WebRTC calling, and multi-gateway fintech checkout.',
                ),
              ),

              // Category Filter Bar
              AnimatedReveal(
                delay: const Duration(milliseconds: 150),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories.map((cat) {
                      final isSelected = _selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() => _selectedCategory = cat);
                          },
                          backgroundColor: AppColors.surface,
                          selectedColor: AppColors.primary,
                          labelStyle: GoogleFonts.inter(
                            fontSize: 12.5,
                            fontWeight:
                                isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected
                                ? Colors.black
                                : AppColors.textSecondary,
                          ),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Projects Grid with Demo Pictures & Interactive Cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredProjects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 26,
                  childAspectRatio: isDesktop ? 0.68 : (isTablet ? 0.72 : 0.88),
                ),
                itemBuilder: (context, index) {
                  final project = _filteredProjects[index];
                  return AnimatedReveal(
                    delay: Duration(milliseconds: 100 * (index % 6)),
                    child: GlassCard(
                      padding: EdgeInsets.zero,
                      onTap: () => ProjectDetailModal.show(context, project),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Demo Picture Mockup Header
                          ProjectMockupWidget(
                            project: project,
                            height: 170,
                          ),

                          // Card Details Content
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    project.tagLine,
                                    style: GoogleFonts.inter(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    project.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      fontSize: 12.5,
                                      color: AppColors.textSecondary,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(
                                      color: AppColors.border, height: 1),
                                  const SizedBox(height: 12),

                                  // Tech Stack Badges
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: project.techStack
                                        .take(4)
                                        .map((tech) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                color: AppColors.surfaceLight,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: AppColors.border),
                                              ),
                                              child: Text(
                                                tech,
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                  fontSize: 10,
                                                  color: AppColors.textPrimary,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                  const Spacer(),

                                  // Action Row with Store Badges & "Explore Case Study"
                                  Row(
                                    children: [
                                      if (project.appStoreUrl != null)
                                        IconButton(
                                          icon: const FaIcon(
                                              FontAwesomeIcons.apple,
                                              size: 18,
                                              color: AppColors.primary),
                                          tooltip: 'View on App Store',
                                          onPressed: () => UrlUtils.launch(
                                              project.appStoreUrl!),
                                        ),
                                      if (project.playStoreUrl != null)
                                        IconButton(
                                          icon: const FaIcon(
                                              FontAwesomeIcons.googlePlay,
                                              size: 16,
                                              color: AppColors.accent),
                                          tooltip: 'View on Google Play',
                                          onPressed: () => UrlUtils.launch(
                                              project.playStoreUrl!),
                                        ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            'Explore Demo',
                                            style: GoogleFonts.inter(
                                              fontSize: 11.5,
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 14,
                                            color: AppColors.primary,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
