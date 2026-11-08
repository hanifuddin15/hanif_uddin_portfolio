import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/animated_reveal.dart';
import '../widgets/glass_card.dart';

class MetricsSection extends StatefulWidget {
  const MetricsSection({super.key});

  @override
  State<MetricsSection> createState() => _MetricsSectionState();
}

class _MetricsSectionState extends State<MetricsSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 800;

    final metrics = [
      {
        'value': 4,
        'suffix': '+',
        'isDecimal': true,
        'label': 'Years of Experience',
        'sub': 'Production Flutter & Dart',
        'icon': Icons.timeline_rounded,
        'progress': 0.85,
        'color': AppColors.primary,
      },
      {
        'value': 10.0,
        'suffix': '+',
        'isDecimal': false,
        'label': 'Store Deployments',
        'sub': 'App Store & Google Play',
        'icon': Icons.storefront_rounded,
        'progress': 0.95,
        'color': AppColors.accent,
      },
      {
        'value': 900.0,
        'suffix': '+',
        'isDecimal': false,
        'label': 'Pub.dev Downloads',
        'sub': 'Open-source libraries',
        'icon': Icons.download_rounded,
        'progress': 0.90,
        'color': AppColors.secondary,
      },
      {
        'value': 100.0,
        'suffix': '%',
        'isDecimal': false,
        'label': 'Clean Architecture',
        'sub': 'BLoC / Riverpod / Modular',
        'icon': Icons.verified_rounded,
        'progress': 1.0,
        'color': const Color(0xFFFFD600),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: metrics.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 4 : 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: isDesktop ? 1.25 : 1.1,
                ),
                itemBuilder: (context, index) {
                  final m = metrics[index];
                  final color = m['color'] as Color;
                  final targetVal = m['value'] as double;
                  final isDecimal = m['isDecimal'] as bool;
                  final currentVal = targetVal * _animation.value;
                  final displayStr = isDecimal
                      ? '${currentVal.toStringAsFixed(1)}${m['suffix']}'
                      : '${currentVal.round()}${m['suffix']}';

                  return AnimatedReveal(
                    delay: Duration(milliseconds: 100 * index),
                    child: GlassCard(
                      padding: const EdgeInsets.all(20),
                      borderColor: color.withValues(alpha: 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(m['icon'] as IconData,
                                color: color, size: 22),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            displayStr,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: color,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            m['label'] as String,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            m['sub'] as String,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: SizedBox(
                              height: 4,
                              width: 80,
                              child: LinearProgressIndicator(
                                value: (m['progress'] as double) *
                                    _animation.value,
                                backgroundColor: AppColors.surfaceLight,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(color),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
