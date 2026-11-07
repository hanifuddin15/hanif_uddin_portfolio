import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanif_portfolio/data/protfolio_data.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    final keys = PortfolioData.skills.keys.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const SectionTitle(
                preTitle: 'Core Capabilities',
                title: 'Technical Arsenal & Specializations',
                subtitle:
                    'Deep domain expertise across the modern cross-platform mobile stack, reactive state engines, and production APIs.',
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: keys.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 3 : 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isDesktop ? 1.4 : 2.0,
                ),
                itemBuilder: (context, index) {
                  final category = keys[index];
                  final items = PortfolioData.skills[category]!;

                  return GlassCard(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Expanded(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: items
                                .map(
                                  (item) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceLight,
                                      borderRadius: BorderRadius.circular(6),
                                      border:
                                          Border.all(color: AppColors.border),
                                    ),
                                    child: Text(
                                      item,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
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
