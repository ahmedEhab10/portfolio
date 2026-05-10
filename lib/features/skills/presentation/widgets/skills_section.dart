import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/theme/app_animations.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
          const SectionHeader(
            label: '// skills',
            title: 'What I work with',
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 280,
              mainAxisExtent: 110,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemCount: PortfolioData.skills.length,
                itemBuilder: (_, i) => AnimateOnScroll(
                  delay: Duration(milliseconds: i * 80),
                child: SkillCard(skill: PortfolioData.skills[i], index: i),
              ),
          ),
        ],
      ),
    );
  }
}
