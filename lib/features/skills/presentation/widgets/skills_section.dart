import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: '// skills', title: 'What I work with'),
          LayoutBuilder(
            builder: (context, constraints) {
              final cols = constraints.maxWidth > 500 ? 2 : 1;
              final skills = PortfolioData.skills;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.8,
                ),
                itemCount: skills.length,
                itemBuilder: (_, i) => SkillCard(skill: skills[i]),
              );
            },
          ),
        ],
      ),
    );
  }
}
