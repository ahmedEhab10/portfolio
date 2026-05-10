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
    final isWide = MediaQuery.of(context).size.width > 700;
    final projects = PortfolioData.projects;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 28,
        vertical: AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: '// projects',
            title: "What I've built",
          ),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(projects.length, (i) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: i == projects.length - 1 ? 0 : 18,
                        ),
                        child: AnimateOnScroll(
                          delay: Duration(milliseconds: i * 150),
                          child: ProjectCard(
                            project: projects[i],
                            onTap: projects[i].images.isNotEmpty
                                ? () => _openProject(context, projects[i])
                                : null,
                          ),
                        ),
                      ),
                    );
                  }),
                )
              : Column(
                  children: List.generate(projects.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: AnimateOnScroll(
                        delay: Duration(milliseconds: i * 150),
                        child: ProjectCard(
                          project: projects[i],
                          onTap: projects[i].images.isNotEmpty
                              ? () => _openProject(context, projects[i])
                              : null,
                        ),
                      ),
                    );
                  }),
                ),
        ],
      ),
    );
  }

  void _openProject(BuildContext context, ProjectModel project) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (ctx, anim, secAnim) => ProjectDetailScreen(project: project),
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
