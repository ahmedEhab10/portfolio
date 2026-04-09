import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    final projects = PortfolioData.projects;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(label: "// projects", title: "What I've built"),
          isWide
              ? Row(
                  children: projects
                      .map(
                        (p) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: p == projects.last ? 0 : 16,
                            ),
                            child: ProjectCard(project: p),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: projects
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ProjectCard(project: p),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }
}
