import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_utils.dart';
import '../../data/protfolio_data.dart';

class InteractivePanel extends StatefulWidget {
  final Map<String, GlobalKey> sectionKeys;

  const InteractivePanel({super.key, required this.sectionKeys});

  @override
  State<InteractivePanel> createState() => _InteractivePanelState();
}

class _InteractivePanelState extends State<InteractivePanel>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  String _activeAssistantAnswer =
      'Hello! I am Hanif\'s interactive assistant. Ask a quick question below or reach out directly.';
  String _copiedStatus = '';

  void _scrollToKey(String keyName) {
    final key = widget.sectionKeys[keyName];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    setState(() {
      _copiedStatus = 'Copied $label!';
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _copiedStatus = '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
      bottom: 24,
      right: isMobile ? 16 : 32,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
        width: _isExpanded ? (isMobile ? screenWidth - 32 : 420) : null,
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 30),
          border: Border.all(
            color: _isExpanded
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.6),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.25),
              blurRadius: 24,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: _isExpanded ? _buildExpandedContent() : _buildCollapsedPill(),
      ),
    );
  }

  Widget _buildCollapsedPill() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => setState(() => _isExpanded = true),
        splashColor: AppColors.primary.withValues(alpha: 0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
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
                '⚡ Interactive Assistant & Quick Reach',
                style: GoogleFonts.inter(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_up,
                  size: 18, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.bolt,
                        color: AppColors.primary, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Interactive Panel',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Hanif Uddin • Available for Hire',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close,
                    color: AppColors.textSecondary, size: 20),
                onPressed: () => setState(() => _isExpanded = false),
                tooltip: 'Minimize Panel',
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 14),

          // Interactive Assistant Answer Box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.border,
                width: 0.8,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.auto_awesome,
                    size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _activeAssistantAnswer,
                    style: GoogleFonts.inter(
                      fontSize: 12.5,
                      color: AppColors.textPrimary,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Quick Question Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildQuestionChip(
                  'Availability?',
                  'Yes! Currently open for Senior Mobile Developer / Team Lead roles and high-impact Flutter architecture consulting.',
                ),
                const SizedBox(width: 8),
                _buildQuestionChip(
                  'Core Stack?',
                  'Flutter, Dart, Clean Architecture, BLoC, Riverpod, WebRTC, Socket.IO, RTMP, Firebase, Supabase, and CI/CD pipelines.',
                ),
                const SizedBox(width: 8),
                _buildQuestionChip(
                  'Store Apps?',
                  '10+ live enterprise and consumer apps deployed to Apple App Store & Google Play Store.',
                ),
                const SizedBox(width: 8),
                _buildQuestionChip(
                  'Leadership?',
                  'Currently Team Lead at Pakiza Software Ltd, mentoring 5+ engineers, leading sprints and architectural reviews.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Quick Contact & Reach Actions
          Text(
            'Direct Reach & One-Click Actions',
            style: GoogleFonts.poppins(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildActionButton(
                icon: const FaIcon(FontAwesomeIcons.envelope,
                    size: 13, color: AppColors.primary),
                label: 'Email',
                onTap: () => UrlUtils.launchMail(PortfolioData.email),
              ),
              _buildActionButton(
                icon: const FaIcon(FontAwesomeIcons.whatsapp,
                    size: 13, color: AppColors.accent),
                label: 'WhatsApp',
                onTap: () => UrlUtils.launchPhone(PortfolioData.phone),
              ),
              _buildActionButton(
                icon: const Icon(Icons.copy, size: 13, color: Colors.white70),
                label: 'Copy Email',
                onTap: () => _copyToClipboard(PortfolioData.email, 'Email'),
              ),
              _buildActionButton(
                icon: const Icon(Icons.phone_android,
                    size: 13, color: Colors.white70),
                label: 'Copy Phone',
                onTap: () => _copyToClipboard(PortfolioData.phone, 'Phone'),
              ),
            ],
          ),

          if (_copiedStatus.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.accent),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check, size: 14, color: AppColors.accent),
                  const SizedBox(width: 6),
                  Text(
                    _copiedStatus,
                    style: GoogleFonts.inter(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 14),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 12),

          // Quick Jump Navigator
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Jump:',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Wrap(
                spacing: 6,
                children: [
                  _buildJumpChip('Projects', 'projects'),
                  _buildJumpChip('Skills', 'skills'),
                  _buildJumpChip('Experience', 'experience'),
                  _buildJumpChip('Contact', 'contact'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionChip(String title, String answer) {
    return InkWell(
      onTap: () {
        setState(() {
          _activeAssistantAnswer = answer;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.4),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJumpChip(String label, String keyName) {
    return InkWell(
      onTap: () => _scrollToKey(keyName),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

