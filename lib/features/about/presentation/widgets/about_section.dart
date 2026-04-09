import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 640;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: '// about me', title: 'Who I am'),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _AboutText()),
                    const SizedBox(width: 32),
                    Expanded(child: _InfoCards()),
                  ],
                )
              : Column(
                  children: [
                    _AboutText(),
                    const SizedBox(height: 24),
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
    return const Text(
      PortfolioData.aboutText,
      style: TextStyle(fontSize: 13, color: AppColors.textMuted, height: 1.9),
    );
  }
}

class _InfoCards extends StatelessWidget {
  static const _info = [
    ('Role', PortfolioData.role),
    ('Location', PortfolioData.location),
    ('Focus', 'Mobile Apps'),
    ('Architecture', 'Clean + MVVM'),
    ('Status', 'Open to Work'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _info
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _InfoRow(keyy: e.$1, value: e.$2),
            ),
          )
          .toList(),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String keyy;
  final String value;
  const _InfoRow({required this.keyy, required this.value});

  @override
  Widget build(BuildContext context) {
    final isStatus = key == 'Status';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            keyy,
            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: isStatus ? AppColors.accent2 : AppColors.accent2,
            ),
          ),
        ],
      ),
    );
  }
}
