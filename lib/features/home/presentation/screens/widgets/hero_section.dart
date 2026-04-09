import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 20, height: 1, color: AppColors.accent2),
              const SizedBox(width: 8),
              const Text(
                PortfolioData.heroTagline,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.accent2,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                height: 1.15,
                fontFamily: 'SpaceMono',
              ),
              children: [
                const TextSpan(
                  text: "Hi, I'm ",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                const TextSpan(
                  text: PortfolioData.name,
                  style: TextStyle(color: AppColors.accent),
                ),
                const TextSpan(
                  text: "\nFlutter Developer",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            PortfolioData.heroBio,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textMuted,
              height: 1.8,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: onViewWork,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'View My Work',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              OutlinedButton(
                onPressed: onContact,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.accent2,
                  side: const BorderSide(color: AppColors.accent2, width: 0.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Get In Touch',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
