import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hanif_portfolio/data/protfolio_data.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsClick;
  final VoidCallback onContactClick;

  const HeroSection({
    super.key,
    required this.onProjectsClick,
    required this.onContactClick,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 80 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: _buildHeroText()),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildHeroAvatar()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildHeroAvatar(),
        const SizedBox(height: 36),
        _buildHeroText(isCenter: true),
      ],
    );
  }

  Widget _buildHeroText({bool isCenter = false}) {
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primary.withOpacity(0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Available for Senior Roles & Architecture Consulting',
                style: GoogleFonts.inter(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Engineering scalable, high-performance mobile systems.',
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: isCenter ? 32 : 46,
            fontWeight: FontWeight.w800,
            height: 1.15,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Hi, I\'m ${PortfolioData.name} — ${PortfolioData.title}. I build mission-critical enterprise applications, real-time WebRTC media engines, and maintain open-source Dart libraries.',
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isCenter ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: onProjectsClick,
              icon: const Icon(Icons.rocket_launch_rounded, size: 18),
              label: const Text('View Flagship Projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContactClick,
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text('Get In Touch'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: const BorderSide(color: AppColors.border, width: 1.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment:
              isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github,
                  color: AppColors.textSecondary),
              onPressed: () => UrlUtils.launch(PortfolioData.github),
              tooltip: 'GitHub',
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.envelope,
                  color: AppColors.textSecondary),
              onPressed: () => UrlUtils.launchMail(PortfolioData.email),
              tooltip: 'Email',
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.phone,
                  color: AppColors.textSecondary),
              onPressed: () => UrlUtils.launchPhone(PortfolioData.phone),
              tooltip: 'Call Phone',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroAvatar() {
    return Center(
      child: Container(
        width: 320,
        height: 320,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.35),
              blurRadius: 40,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surface,
          ),
          child: const Center(
            child: CircleAvatar(
              radius: 145,
              backgroundImage: NetworkImage(
                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Hanif%20JPG-ixXCWpDg3vxVrdygfqi05HDGk80wq9.jpeg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
