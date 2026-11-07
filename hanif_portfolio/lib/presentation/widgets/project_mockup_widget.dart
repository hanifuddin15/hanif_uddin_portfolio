import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/project_model.dart';

class ProjectMockupWidget extends StatelessWidget {
  final ProjectModel project;
  final double height;
  final bool isInteractive;

  const ProjectMockupWidget({
    super.key,
    required this.project,
    this.height = 190,
    this.isInteractive = true,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = project.gradientColors != null &&
            project.gradientColors!.length >= 2
        ? LinearGradient(
            colors: project.gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        gradient: gradient,
      ),
      child: Stack(
        children: [
          // Background ambient pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.12,
              child: CustomPaint(
                painter: _GridPatternPainter(),
              ),
            ),
          ),

          // Central Device Preview Layout
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: _buildDeviceMockup(context),
            ),
          ),

          // Impact badge pill on top-right
          if (project.impactMetric != null)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      project.impactMetric!,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Category pill on top-left
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 0.8,
                ),
              ),
              child: Text(
                project.category.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceMockup(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Device Status Bar / Dynamic Island
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF1F2937), width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '9:41',
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 38,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi, size: 8, color: Colors.white70),
                    const SizedBox(width: 3),
                    const Icon(Icons.battery_full,
                        size: 9, color: Colors.white70),
                  ],
                ),
              ],
            ),
          ),

          // Custom App-Specific UI Mockup Content
          Padding(
            padding: const EdgeInsets.all(10),
            child: _buildProjectSpecificUI(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectSpecificUI() {
    if (project.title.contains('Cripton')) {
      // Enterprise HRIS & VMS Mockup
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF00E5FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.fingerprint,
                    color: Color(0xFF00E5FF), size: 16),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biometric Attendance',
                      style: GoogleFonts.inter(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'SSP Auto-Approval Active',
                      style: GoogleFonts.inter(
                          fontSize: 7.5, color: const Color(0xFF00E676)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2638),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fleet Vehicles: 24 Online',
                    style: GoogleFonts.inter(fontSize: 8, color: Colors.white70)),
                const Icon(Icons.directions_car,
                    size: 10, color: Color(0xFF00E5FF)),
              ],
            ),
          ),
        ],
      );
    } else if (project.title.contains('Quantum')) {
      // Social & Crypto Network Mockup
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 3),
                    Text('LIVE 14.8K',
                        style: GoogleFonts.inter(
                            fontSize: 7,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ],
                ),
              ),
              Text(
                'Wallet: \$4,850.20',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFE040FB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF2E1A47),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                const Icon(Icons.play_circle_fill,
                    size: 14, color: Color(0xFFE040FB)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Reels Feed • RTMP Stream Engine',
                    style: GoogleFonts.inter(
                        fontSize: 7.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.favorite, size: 10, color: Colors.redAccent),
              ],
            ),
          ),
        ],
      );
    } else if (project.title.contains('Messenger')) {
      // WebRTC Messenger Mockup
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 9,
                backgroundColor: Color(0xFF00B0FF),
                child: Icon(Icons.person, size: 10, color: Colors.white),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Executive Team Call',
                        style: GoogleFonts.inter(
                            fontSize: 8.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Text('HD WebRTC Active • 04:18',
                        style: GoogleFonts.inter(
                            fontSize: 7, color: const Color(0xFF00E676))),
                  ],
                ),
              ),
              const Icon(Icons.call_end, size: 12, color: Colors.redAccent),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF132F4C),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                const Icon(Icons.graphic_eq,
                    size: 12, color: Color(0xFF00E5FF)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'P2P Audio Stream • <100ms Latency',
                    style: GoogleFonts.jetBrainsMono(
                        fontSize: 7, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else if (project.title.contains('MemeVerse')) {
      // AI Platform Mockup
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, size: 12, color: Color(0xFFFFD600)),
              const SizedBox(width: 5),
              Text('Vertex AI Generator',
                  style: GoogleFonts.inter(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF3D00).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Genkit',
                    style: GoogleFonts.inter(
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFD600))),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF2C1E0A),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: const Color(0xFFFFD600).withValues(alpha: 0.3)),
            ),
            child: Text(
              'Prompt: "Senior Flutter Dev shipping zero bug release..."',
              style: GoogleFonts.inter(
                  fontSize: 7.5,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      );
    } else if (project.title.contains('AUSTTAA')) {
      // Alumni Network Mockup
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.school, size: 12, color: Color(0xFF00E676)),
              const SizedBox(width: 5),
              Text('Alumni Career Network',
                  style: GoogleFonts.inter(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ],
          ),
          const SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF14301C),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                const Icon(Icons.work_outline,
                    size: 11, color: Color(0xFF00E676)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text('5+ New Textile Executive Roles',
                      style: GoogleFonts.inter(
                          fontSize: 7.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      // ShopySwiss E-Commerce Mockup
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Swiss Chrono Series X',
                  style: GoogleFonts.inter(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              Text('\$249.00',
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFFF5252))),
            ],
          ),
          const SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF330E0E),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                const Icon(Icons.shopping_bag_outlined,
                    size: 11, color: Color(0xFFFF5252)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text('Live Cart Sync • SQLite Offline',
                      style: GoogleFonts.inter(
                          fontSize: 7.5,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500)),
                ),
                Text('4.9 ★',
                    style: GoogleFonts.inter(
                        fontSize: 7.5,
                        color: Colors.amber,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _GridPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5;

    const spacing = 18.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

