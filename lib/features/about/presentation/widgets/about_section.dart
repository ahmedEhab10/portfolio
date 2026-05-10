import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/theme/app_animations.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 28,
        vertical: AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: '// about me', title: 'Who I am'),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _AboutText()),
                    const SizedBox(width: 40),
                    Expanded(child: _InfoCards()),
                  ],
                )
              : Column(
                  children: [
                    _AboutText(),
                    const SizedBox(height: 28),
                    _InfoCards(),
                  ],
                ),
        ],
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimateOnScroll(
      delay: const Duration(milliseconds: 100),
      child: Text(
        PortfolioData.aboutText,
        style: AppTextStyles.body,
      ),
    );
  }
}

class _InfoCards extends StatelessWidget {
  static const _info = [
    ('Role', PortfolioData.role, false),
    ('Location', PortfolioData.location, false),
    ('Focus', 'Mobile Apps', false),
    ('Architecture', 'Clean + MVVM', false),
    ('Status', 'Open to Work', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_info.length, (i) {
        return AnimateOnScroll(
          delay: Duration(milliseconds: 150 + i * 80),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _InfoRow(
              label: _info[i].$1,
              value: _info[i].$2,
              isStatus: _info[i].$3,
            ),
          ),
        );
      }),
    );
  }
}

class _InfoRow extends StatefulWidget {
  final String label;
  final String value;
  final bool isStatus;
  const _InfoRow({
    required this.label,
    required this.value,
    this.isStatus = false,
  });

  @override
  State<_InfoRow> createState() => _InfoRowState();
}

class _InfoRowState extends State<_InfoRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.bg3 : AppColors.bg2,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(
            color: _hovered ? AppColors.borderLight : AppColors.border,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label, style: AppTextStyles.bodySmall),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.isStatus)
                  Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                      color: AppColors.accent2,
                      shape: BoxShape.circle,
                    ),
                  ),
                Text(
                  widget.value,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: widget.isStatus
                        ? AppColors.accent2
                        : AppColors.accentLight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
