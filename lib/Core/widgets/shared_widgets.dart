// ── Section Header ────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  const SectionHeader({super.key, required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.accent2,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

// ── Divider ───────────────────────────────────────────────────────
class PortfolioDivider extends StatelessWidget {
  const PortfolioDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 0.5, color: AppColors.border);
  }
}

// ── Skill Card ────────────────────────────────────────────────────
class SkillCard extends StatelessWidget {
  final SkillModel skill;
  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.diamond_outlined, color: AppColors.accent, size: 16),
          const SizedBox(height: 8),
          Text(
            skill.name,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            skill.level,
            style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: skill.percent,
              backgroundColor: AppColors.bg3,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
              minHeight: 3,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Project Card ──────────────────────────────────────────────────
class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Project Image ──────────────────────────────────────
          if (project.imageUrl != null)
            Image.asset(
              project.imageUrl!,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160,
                color: AppColors.bg3,
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: AppColors.textMuted,
                    size: 32,
                  ),
                ),
              ),
            ),
          // ── Card Content ───────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.bg3,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border, width: 0.5),
                      ),
                      child: const Icon(
                        Icons.diamond_outlined,
                        color: AppColors.accent,
                        size: 16,
                      ),
                    ),
                    _Badge(label: project.badge),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.chips.map((c) => _Chip(label: c)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.accent2.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accent2.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.accent2,
          letterSpacing: 0.5,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.bg3,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.accent2.withOpacity(0.15),
          width: 0.5,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, color: AppColors.accent2),
      ),
    );
  }
}
