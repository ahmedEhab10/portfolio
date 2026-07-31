import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/features/about/presentation/widgets/about_section.dart';
import 'package:my_portfolio/features/contact/presentation/widgets/contact_section.dart';
import 'package:my_portfolio/features/home/presentation/screens/widgets/hero_section.dart';
import 'package:my_portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:my_portfolio/features/skills/presentation/widgets/skills_section.dart';

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
  int _activeIndex = 0;
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollCtrl.offset;
    setState(() {
      _scrolled = offset > 50;
    });
    // Determine active section
    final keys = [_aboutKey, _skillsKey, _projectsKey, _contactKey];
    for (int i = keys.length - 1; i >= 0; i--) {
      final ctx = keys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final pos = box.localToGlobal(Offset.zero).dy;
        if (pos <= 200) {
          if (_activeIndex != i) setState(() => _activeIndex = i);
          return;
        }
      }
    }
    if (_activeIndex != -1 && offset < 100) {
      setState(() => _activeIndex = -1);
    }
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollCtrl,
            child: Column(
              children: [
                const SizedBox(height: 64), // Space for navbar
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
          // Floating navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _NavBar(
              scrolled: _scrolled,
              activeIndex: _activeIndex,
              onAbout: () => _scrollTo(_aboutKey),
              onSkills: () => _scrollTo(_skillsKey),
              onProjects: () => _scrollTo(_projectsKey),
              onContact: () => _scrollTo(_contactKey),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_onScroll);
    _scrollCtrl.dispose();
    super.dispose();
  }
}

// ── NavBar ────────────────────────────────────────────────────────
class _NavBar extends StatelessWidget {
  final bool scrolled;
  final int activeIndex;
  final VoidCallback onAbout, onSkills, onProjects, onContact;

  const _NavBar({
    required this.scrolled,
    required this.activeIndex,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      ('About', onAbout),
      ('Skills', onSkills),
      ('Projects', onProjects),
      ('Contact', onContact),
    ];

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: scrolled ? 20 : 0,
          sigmaY: scrolled ? 20 : 0,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: scrolled
                ? AppColors.bg.withAlpha(200)
                : AppColors.bg.withAlpha(240),
            border: Border(
              bottom: BorderSide(
                color: scrolled ? AppColors.borderLight : AppColors.border,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              // Logo
              RichText(
                text: TextSpan(
                  style: AppTextStyles.subheading,
                  children: [
                    TextSpan(
                      text: PortfolioData.firstName,
                      style: const TextStyle(color: AppColors.accent),
                    ),
                    const TextSpan(
                      text: '.',
                      style: TextStyle(color: AppColors.accent2),
                    ),
                    const TextSpan(
                      text: 'dev',
                      style: TextStyle(color: AppColors.accent),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Nav items
              ...List.generate(items.length, (i) {
                final isActive = activeIndex == i;
                return Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: _NavItem(
                    label: items[i].$1,
                    isActive: isActive,
                    onTap: items[i].$2,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: widget.isActive || _hovered
                    ? AppTextStyles.navItemActive
                    : AppTextStyles.navItem,
                child: Text(widget.label.toUpperCase()),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.isActive ? 20 : (_hovered ? 12 : 0),
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Footer ────────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: Column(
        children: [
          // Social icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.github,
                url: PortfolioData.github,
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: PortfolioData.linkedin,
              ),
              const SizedBox(width: 20),
              _SocialIcon(
                icon: FontAwesomeIcons.envelope,
                url: 'mailto:${PortfolioData.email}',
              ),
            ],
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.label,
              children: [
                const TextSpan(text: 'Built with '),
                TextSpan(
                  text: 'Flutter 💙',
                  style: TextStyle(color: AppColors.accent),
                ),
                const TextSpan(text: ' by '),
                TextSpan(
                  text: PortfolioData.name,
                  style: TextStyle(color: AppColors.accent),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} All rights reserved',
            style: AppTextStyles.label.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final FaIconData icon;
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent.withAlpha(20) : AppColors.bg2,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(
              color: _hovered ? AppColors.accent : AppColors.border,
              width: 0.5,
            ),
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              size: 16,
              color: _hovered ? AppColors.accent : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
