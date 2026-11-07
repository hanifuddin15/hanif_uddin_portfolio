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
import 'presentation/widgets/interactive_panel.dart';
import 'presentation/widgets/navigation_bar.dart';
import 'presentation/widgets/scroll_progress_indicator.dart';

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
        brightness: Brightness.dark,
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

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(scrollControllerProvider);
      controller.addListener(() {
        final shouldShow = controller.hasClients && controller.offset > 450;
        if (shouldShow != _showBackToTop && mounted) {
          setState(() {
            _showBackToTop = shouldShow;
          });
        }
      });
    });
  }

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

  void _scrollToTop() {
    final controller = ref.read(scrollControllerProvider);
    if (controller.hasClients) {
      controller.animateTo(
        0,
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
          // Ambient Background Glow Orbs for visual depth
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 700,
            right: -150,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withValues(alpha: 0.07),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 1800,
            left: -150,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main Scrollable Content
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(height: 72), // Navigation bar spacer
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
                const SizedBox(height: 80), // Spacer for bottom interactive dock
              ],
            ),
          ),

          // Top Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomNavigationBar(sectionKeys: _sectionKeys),
                ScrollProgressIndicator(scrollController: scrollController),
              ],
            ),
          ),

          // Human Interactive Action Panel & Assistant Dock
          InteractivePanel(sectionKeys: _sectionKeys),

          // Floating Back To Top Button
          if (_showBackToTop)
            Positioned(
              bottom: 28,
              left: 28,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showBackToTop ? 1.0 : 0.0,
                child: FloatingActionButton.small(
                  onPressed: _scrollToTop,
                  backgroundColor: AppColors.surface,
                  foregroundColor: AppColors.primary,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppColors.primary.withValues(alpha: 0.5),
                    ),
                  ),
                  tooltip: 'Back to Top',
                  child: const Icon(Icons.arrow_upward_rounded, size: 18),
                ),
              ),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border, width: 0.8)),
      ),
      child: Center(
        child: Text(
          '© 2026 Hanif Uddin. Engineered natively with Flutter Web, Clean Architecture & Riverpod.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
