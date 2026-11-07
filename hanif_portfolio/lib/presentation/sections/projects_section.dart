import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanif_portfolio/data/protfolio_data.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1000;
    final isTablet = width >= 650 && width < 1000;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionTitle(
                preTitle: 'Production Case Studies',
                title: 'Featured Apps & Flagship Architecture',
                subtitle:
                    'Engineered to scale. From multi-module enterprise systems with biometric security to high-traffic social live-streaming platforms.',
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PortfolioData.projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isDesktop ? 0.8 : (isTablet ? 0.85 : 0.95),
                ),
                itemBuilder: (context, index) {
                  final project = PortfolioData.projects[index];
                  return GlassCard(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          project.tagLine,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          project.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Divider(color: AppColors.border),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: project.techStack
                              .take(4)
                              .map((tech) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceLight,
                                      borderRadius: BorderRadius.circular(6),
                                      border:
                                          Border.all(color: AppColors.border),
                                    ),
                                    child: Text(
                                      tech,
                                      style: GoogleFonts.jetBrainsMono(
                                        fontSize: 10.5,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            if (project.appStoreUrl != null)
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.apple,
                                    size: 20, color: AppColors.primary),
                                tooltip: 'View on App Store',
                                onPressed: () =>
                                    UrlUtils.launch(project.appStoreUrl!),
                              ),
                            if (project.playStoreUrl != null)
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.googlePlay,
                                    size: 19, color: AppColors.accent),
                                tooltip: 'View on Google Play',
                                onPressed: () =>
                                    UrlUtils.launch(project.playStoreUrl!),
                              ),
                            const Spacer(),
                            Text(
                              'Verified Build',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      ],
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
