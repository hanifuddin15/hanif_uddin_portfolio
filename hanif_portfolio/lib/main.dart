import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanif_portfolio/presentation/providers/proftfolio_providers.dart';
import 'package:hanif_portfolio/presentation/sections/metric_section.dart';
import 'core/constants/app_colors.dart';
import 'presentation/sections/contact_section.dart';
import 'presentation/sections/experience_section.dart';
import 'presentation/sections/hero_section.dart';
import 'presentation/sections/packages_section.dart';
import 'presentation/sections/projects_section.dart';
import 'presentation/sections/skills_section.dart';
import 'presentation/widgets/navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: PortfolioApp()));
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanif Uddin | Senior Flutter Developer & Team Lead',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'packages': GlobalKey(),
    'skills': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(height: 70), // Navigation spacer
                HeroSection(
                  key: _sectionKeys['hero'],
                  onProjectsClick: () =>
                      _scrollToKey(_sectionKeys['projects']!),
                  onContactClick: () => _scrollToKey(_sectionKeys['contact']!),
                ),
                const MetricsSection(),
                ProjectsSection(key: _sectionKeys['projects']),
                ExperienceSection(key: _sectionKeys['experience']),
                PackagesSection(key: _sectionKeys['packages']),
                SkillsSection(key: _sectionKeys['skills']),
                ContactSection(key: _sectionKeys['contact']),
                const _FooterWidget(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(sectionKeys: _sectionKeys),
          ),
        ],
      ),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border, width: 0.8)),
      ),
      child: Text(
        '© 2026 Hanif Uddin. Engineered natively with Flutter Web & Riverpod.',
        style: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontSize: 13,
        ),
      ),
    );
  }
}
