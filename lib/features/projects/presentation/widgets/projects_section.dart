import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/theme/app_animations.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';
import 'package:my_portfolio/features/projects/presentation/screens/project_detail_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final projects = PortfolioData.projects;

    // Responsive column count
    final int crossAxisCount;
    final double horizontalPadding;
    if (width > 1100) {
      crossAxisCount = 3;
      horizontalPadding = 60;
    } else if (width > 700) {
      crossAxisCount = 2;
      horizontalPadding = 48;
    } else {
      crossAxisCount = 1;
      horizontalPadding = 24;
    }

    // Build rows of cards
    final List<Widget> rows = [];
    for (int i = 0; i < projects.length; i += crossAxisCount) {
      final rowProjects = projects.sublist(
        i,
        (i + crossAxisCount).clamp(0, projects.length),
      );

      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(rowProjects.length, (j) {
              final globalIndex = i + j;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: j < rowProjects.length - 1 ? 18 : 0,
                  ),
                  child: AnimateOnScroll(
                    delay: Duration(milliseconds: globalIndex * 120),
                    child: ProjectCard(
                      project: rowProjects[j],
                      onTap: rowProjects[j].images.isNotEmpty
                          ? () => _openProject(context, rowProjects[j])
                          : null,
                    ),
                  ),
                ),
              );
            }),
            // Fill remaining slots in last row to keep alignment
          ),
        ),
      );

      if (i + crossAxisCount < projects.length) {
        rows.add(const SizedBox(height: 20));
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: '// projects',
            title: "What I've built",
          ),
          ...rows,
        ],
      ),
    );
  }

  void _openProject(BuildContext context, ProjectModel project) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (ctx, anim, secAnim) =>
            ProjectDetailScreen(project: project),
        transitionsBuilder: (ctx, animation, secAnim, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.05),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
