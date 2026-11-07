import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanif_portfolio/data/protfolio_data.dart';
import '../../core/constants/app_colors.dart';

class CustomNavigationBar extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;

  const CustomNavigationBar({super.key, required this.sectionKeys});

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = MediaQuery.of(context).size.width >= 850;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.85),
        border: const Border(
            bottom: BorderSide(color: AppColors.border, width: 0.8)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'H',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    PortfolioData.name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              if (isDesktop)
                Row(
                  children: [
                    _navItem('Projects',
                        () => _scrollToKey(sectionKeys['projects']!)),
                    _navItem('Experience',
                        () => _scrollToKey(sectionKeys['experience']!)),
                    _navItem('Packages',
                        () => _scrollToKey(sectionKeys['packages']!)),
                    _navItem(
                        'Skills', () => _scrollToKey(sectionKeys['skills']!)),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => _scrollToKey(sectionKeys['contact']!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        textStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      child: const Text('Hire Me'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
