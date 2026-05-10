import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';

class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;
  const ProjectDetailScreen({super.key, required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final p = widget.project;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // App bar
          SliverAppBar(
            backgroundColor: AppColors.bg.withAlpha(230),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded,
                  color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(p.title, style: AppTextStyles.subheading),
            centerTitle: true,
            pinned: true,
            elevation: 0,
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 80 : 20,
                vertical: 24,
              ),
              child: isWide
                  ? _buildWideLayout(p)
                  : _buildNarrowLayout(p),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(ProjectModel p) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image carousel
        Expanded(flex: 3, child: _buildCarousel(p)),
        const SizedBox(width: 40),
        // Details
        Expanded(flex: 2, child: _buildDetails(p)),
      ],
    );
  }

  Widget _buildNarrowLayout(ProjectModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCarousel(p),
        const SizedBox(height: 28),
        _buildDetails(p),
      ],
    );
  }

  Widget _buildCarousel(ProjectModel p) {
    if (p.images.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: p.images.length,
          options: CarouselOptions(
            height: 500,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (i, reason) => setState(() => _currentImage = i),
          ),
          itemBuilder: (ctx, i, realI) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(
                  color: AppColors.border,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withAlpha(15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                p.images[i],
                fit: BoxFit.cover,
                errorBuilder: (_, e, st) => Container(
                  color: AppColors.bg3,
                  child: const Center(
                    child: Icon(Icons.image_outlined,
                        color: AppColors.textMuted, size: 48),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        AnimatedSmoothIndicator(
          activeIndex: _currentImage,
          count: p.images.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: AppColors.accent,
            dotColor: AppColors.bg3,
            expansionFactor: 3,
            spacing: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(ProjectModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accent.withAlpha(20),
            borderRadius: BorderRadius.circular(AppRadius.round),
            border: Border.all(
              color: AppColors.accent.withAlpha(50), width: 0.5,
            ),
          ),
          child: Text(
            p.badge,
            style: AppTextStyles.chip.copyWith(color: AppColors.accentLight),
          ),
        ),
        const SizedBox(height: 18),
        // Title
        Text(p.title, style: AppTextStyles.displayMedium),
        const SizedBox(height: 14),
        // Description
        Text(p.description, style: AppTextStyles.body),
        const SizedBox(height: 24),
        // Tech chips
        Text('Tech Stack', style: AppTextStyles.caption),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: p.chips.map((c) => _TechChip(label: c)).toList(),
        ),
        // Features
        if (p.features.isNotEmpty) ...[
          const SizedBox(height: 28),
          Text('Features', style: AppTextStyles.caption),
          const SizedBox(height: 14),
          ...p.features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(Icons.check_circle_outline,
                          color: AppColors.accent2, size: 14),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(f, style: AppTextStyles.bodySmall),
                    ),
                  ],
                ),
              )),
        ],
        // Action buttons
        const SizedBox(height: 28),
        if (p.githubUrl != null)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.parse(p.githubUrl!)),
              icon: const FaIcon(FontAwesomeIcons.github, size: 16),
              label: const Text('View on GitHub'),
            ),
          ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bg3,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: AppColors.accent2.withAlpha(30), width: 0.5,
        ),
      ),
      child: Text(label, style: AppTextStyles.chip),
    );
  }
}
