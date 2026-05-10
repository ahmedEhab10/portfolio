import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/widgets/animated_background.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _entranceCtrl;
  late List<Animation<double>> _fadeAnims;
  late List<Animation<Offset>> _slideAnims;

  @override
  void initState() {
    super.initState();
    _entranceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // 5 staggered items: tagline, name, role-typing, bio, buttons
    _fadeAnims = List.generate(5, (i) {
      final start = i * 0.15;
      final end = (start + 0.3).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _entranceCtrl,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    _slideAnims = List.generate(5, (i) {
      final start = i * 0.15;
      final end = (start + 0.3).clamp(0.0, 1.0);
      return Tween<Offset>(
        begin: const Offset(0, 20),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _entranceCtrl,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ));
    });

    _entranceCtrl.forward();
  }

  Widget _animated(int index, Widget child) {
    return AnimatedBuilder(
      animation: _entranceCtrl,
      child: child,
      builder: (_, cachedChild) => Opacity(
        opacity: _fadeAnims[index].value,
        child: Transform.translate(
          offset: _slideAnims[index].value,
          child: cachedChild,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final isWide = screenW > 800;

    return AnimatedBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 60 : 28,
          vertical: isWide ? 80 : 56,
        ),
        child: isWide ? _buildWideLayout() : _buildNarrowLayout(),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: _buildTextContent()),
        const SizedBox(width: 48),
        Expanded(flex: 2, child: _buildProfileVisual()),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: _buildProfileVisual()),
        const SizedBox(height: 36),
        _buildTextContent(),
      ],
    );
  }

  Widget _buildProfileVisual() {
    return _animated(
      0,
      Center(
        child: Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accent.withAlpha(60), width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withAlpha(30),
                blurRadius: 40,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              PortfolioData.profileImage,
              fit: BoxFit.cover,
              errorBuilder: (_, e, st) => Container(
                color: AppColors.bg3,
                child: Center(
                  child: Text(
                    PortfolioData.firstName[0],
                    style: AppTextStyles.displayLarge.copyWith(
                      color: AppColors.accent,
                      fontSize: 72,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tagline
        _animated(
          1,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 24, height: 1, color: AppColors.accent2),
              const SizedBox(width: 10),
              Text(PortfolioData.heroTagline, style: AppTextStyles.caption),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Name
        _animated(
          2,
          RichText(
            text: TextSpan(
              style: AppTextStyles.displayLarge,
              children: [
                const TextSpan(text: "Hi, I'm "),
                TextSpan(
                  text: PortfolioData.firstName,
                  style: TextStyle(color: AppColors.accent),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Typing role
        _animated(
          2,
          SizedBox(
            height: 36,
            child: DefaultTextStyle(
              style: AppTextStyles.displayMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Developer',
                    speed: const Duration(milliseconds: 80),
                  ),
                  TypewriterAnimatedText(
                    'Mobile App Builder',
                    speed: const Duration(milliseconds: 80),
                  ),
                  TypewriterAnimatedText(
                    'Clean Code Advocate',
                    speed: const Duration(milliseconds: 80),
                  ),
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 2000),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Bio
        _animated(
          3,
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(PortfolioData.heroBio, style: AppTextStyles.body),
          ),
        ),
        const SizedBox(height: 32),
        // Buttons
        _animated(
          4,
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              ElevatedButton(
                onPressed: widget.onViewWork,
                child: const Text('View My Work'),
              ),
              OutlinedButton(
                onPressed: widget.onContact,
                child: const Text('Get In Touch'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _entranceCtrl.dispose();
    super.dispose();
  }
}
