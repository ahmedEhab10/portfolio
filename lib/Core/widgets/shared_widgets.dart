// ── Shared Widgets ────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/theme/app_animations.dart';

// ── Section Header ────────────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  const SectionHeader({super.key, required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    return AnimateOnScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Text(title, style: AppTextStyles.heading),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ── Divider ───────────────────────────────────────────────────────
class PortfolioDivider extends StatelessWidget {
  const PortfolioDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28),
      height: 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.border.withAlpha(0),
            AppColors.border,
            AppColors.border.withAlpha(0),
          ],
        ),
      ),
    );
  }
}

// ── Skill Card ────────────────────────────────────────────────────
class SkillCard extends StatefulWidget {
  final SkillModel skill;
  final int index;
  const SkillCard({super.key, required this.skill, this.index = 0});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _progressController;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  void triggerProgressAnimation() {
    if (!_hasAnimated) {
      _hasAnimated = true;
      Future.delayed(Duration(milliseconds: widget.index * 100), () {
        if (mounted) _progressController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger animation when built (parent wraps in AnimateOnScroll)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      triggerProgressAnimation();
    });

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.bg3 : AppColors.bg2,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: _isHovered ? AppColors.borderLight : AppColors.border,
            width: 0.5,
          ),
          boxShadow: _isHovered ? AppShadows.cardShadow : null,
        ),
        transform: _isHovered
            ? (Matrix4.identity()..setTranslationRaw(0.0, -2.0, 0.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(widget.skill.icon, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.skill.name,
                    style: AppTextStyles.subheading.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(widget.skill.level, style: AppTextStyles.label),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _progressController,
              builder: (context, _) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: widget.skill.percent *
                        CurvedAnimation(
                          parent: _progressController,
                          curve: Curves.easeOutCubic,
                        ).value,
                    backgroundColor: AppColors.bg3,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColors.accent),
                    minHeight: 3,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }
}

// ── Project Card ──────────────────────────────────────────────────
class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback? onTap;
  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hasImages = widget.project.images.isNotEmpty;

    Widget buildMockup(String path, double width) {
      return Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          border: const Border(
            top: BorderSide(color: AppColors.borderLight, width: 1.5),
            left: BorderSide(color: AppColors.borderLight, width: 1.5),
            right: BorderSide(color: AppColors.borderLight, width: 1.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(120),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          path,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          errorBuilder: (_, e, st) => Container(color: AppColors.bg3),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.bg3 : AppColors.bg2,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: _isHovered ? AppColors.borderLight : AppColors.border,
              width: 0.5,
            ),
            boxShadow: _isHovered ? AppShadows.cardShadow : null,
          ),
          transform: _isHovered
              ? (Matrix4.identity()..setTranslationRaw(0.0, -4.0, 0.0))
              : Matrix4.identity(),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Project Image ──────────────────────────────
              if (hasImages)
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.bg3,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.accent.withAlpha(30),
                            AppColors.accent2.withAlpha(10),
                          ],
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // Left Image
                          if (widget.project.images.length > 1)
                            Positioned(
                              top: 40,
                              bottom: -20,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(-110.0, 0.0)
                                  ..rotateZ(-0.12),
                                alignment: Alignment.bottomCenter,
                                child: buildMockup(widget.project.images[1], 150),
                              ),
                            ),
                          // Right Image
                          if (widget.project.images.length > 2)
                            Positioned(
                              top: 40,
                              bottom: -20,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(110.0, 0.0)
                                  ..rotateZ(0.12),
                                alignment: Alignment.bottomCenter,
                                child: buildMockup(widget.project.images[2], 150),
                              ),
                            ),
                          // Center Image
                          Positioned(
                            top: 24,
                            bottom: -10,
                            child: buildMockup(widget.project.images[0], 180),
                          ),
                        ],
                      ),
                    ),
                    // Hover overlay
                    if (_isHovered && widget.onTap != null)
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: _isHovered ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            color: AppColors.accent.withAlpha(30),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.round),
                                ),
                                child: Text(
                                  'View Details →',
                                  style: AppTextStyles.button
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    // Image count badge
                    if (widget.project.images.length > 1)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.bg.withAlpha(180),
                            borderRadius:
                                BorderRadius.circular(AppRadius.round),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.photo_library_outlined,
                                  size: 12, color: AppColors.textMuted),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.project.images.length}',
                                style: AppTextStyles.label
                                    .copyWith(color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              // ── Card Content ───────────────────────────────
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: AppColors.bg3,
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                            border: Border.all(
                                color: AppColors.border, width: 0.5),
                          ),
                          child: const Icon(Icons.diamond_outlined,
                              color: AppColors.accent, size: 16),
                        ),
                        _Badge(label: widget.project.badge),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      widget.project.title,
                      style: AppTextStyles.subheading,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: AppTextStyles.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.chips
                          .map((c) => _Chip(label: c))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    final isFeatured = label == 'Featured';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: (isFeatured ? AppColors.accent : AppColors.accent2).withAlpha(20),
        borderRadius: BorderRadius.circular(AppRadius.round),
        border: Border.all(
          color: (isFeatured ? AppColors.accent : AppColors.accent2)
              .withAlpha(50),
          width: 0.5,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.chip.copyWith(
          color: isFeatured ? AppColors.accentLight : AppColors.accent2,
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bg3,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: AppColors.accent2.withAlpha(30),
          width: 0.5,
        ),
      ),
      child: Text(label, style: AppTextStyles.chip),
    );
  }
}
