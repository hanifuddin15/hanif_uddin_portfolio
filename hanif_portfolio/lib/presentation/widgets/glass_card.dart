import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? borderColor;
  final bool enableHover;
  final double borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.borderColor,
    this.enableHover = true,
    this.borderRadius = 16,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = widget.borderColor ??
        (_isHovered
            ? AppColors.primary.withValues(alpha: 0.9)
            : AppColors.border.withValues(alpha: 0.6));

    final effectiveBoxShadow = [
      BoxShadow(
        color: _isHovered
            ? AppColors.primary.withValues(alpha: 0.18)
            : Colors.black.withValues(alpha: 0.35),
        blurRadius: _isHovered ? 28 : 18,
        spreadRadius: _isHovered ? 2 : 0,
        offset: Offset(0, _isHovered ? 12 : 8),
      ),
    ];

    return MouseRegion(
      onEnter: (_) {
        if (widget.enableHover) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (widget.enableHover) setState(() => _isHovered = false);
      },
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(
          0,
          (_isHovered && widget.enableHover) ? -6 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.surfaceLight.withValues(alpha: 0.85)
              : AppColors.surface.withValues(alpha: 0.75),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: effectiveBorderColor,
            width: _isHovered ? 1.6 : 1.2,
          ),
          boxShadow: effectiveBoxShadow,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            onTap: widget.onTap,
            splashColor: AppColors.primary.withValues(alpha: 0.12),
            highlightColor: AppColors.primary.withValues(alpha: 0.05),
            child: Padding(
              padding: widget.padding ?? const EdgeInsets.all(24),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
