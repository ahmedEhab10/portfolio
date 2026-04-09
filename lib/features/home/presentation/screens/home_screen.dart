import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';
import 'package:my_portfolio/features/about/presentation/widgets/about_section.dart';
import 'package:my_portfolio/features/contact/presentation/widgets/contact_section.dart';
import 'package:my_portfolio/features/home/presentation/screens/widgets/hero_section.dart';
import 'package:my_portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/skills_section.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/portfolio_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollCtrl = ScrollController();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          _NavBar(
            onAbout: () => _scrollTo(_aboutKey),
            onSkills: () => _scrollTo(_skillsKey),
            onProjects: () => _scrollTo(_projectsKey),
            onContact: () => _scrollTo(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollCtrl,
              child: Column(
                children: [
                  HeroSection(
                    onViewWork: () => _scrollTo(_projectsKey),
                    onContact: () => _scrollTo(_contactKey),
                  ),
                  const PortfolioDivider(),
                  AboutSection(key: _aboutKey),
                  const PortfolioDivider(),
                  SkillsSection(key: _skillsKey),
                  const PortfolioDivider(),
                  ProjectsSection(key: _projectsKey),
                  const PortfolioDivider(),
                  ContactSection(key: _contactKey),
                  _Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }
}

class _NavBar extends StatelessWidget {
  final VoidCallback onAbout, onSkills, onProjects, onContact;
  const _NavBar({
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.bg.withOpacity(0.95),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'SpaceMono',
              ),
              children: [
                TextSpan(
                  text: 'Ahmed',
                  style: TextStyle(color: AppColors.accent),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(color: AppColors.accent2),
                ),
                TextSpan(
                  text: 'dev',
                  style: TextStyle(color: AppColors.accent),
                ),
              ],
            ),
          ),
          const Spacer(),
          ...[
            ('About', onAbout),
            ('Skills', onSkills),
            ('Projects', onProjects),
            ('Contact', onContact),
          ].map(
            (e) => Padding(
              padding: const EdgeInsets.only(left: 24),
              child: GestureDetector(
                onTap: e.$2,
                child: Text(
                  e.$1.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textMuted,
            fontFamily: 'SpaceMono',
          ),
          children: [
            TextSpan(text: 'Built with logic by '),
            TextSpan(
              text: PortfolioData.name,
              style: TextStyle(color: AppColors.accent),
            ),
            TextSpan(text: ' — Flutter Developer from Egypt'),
          ],
        ),
      ),
    );
  }
}
