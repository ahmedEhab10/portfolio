import 'package:flutter/material.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: '// contact',
            title: "Let's work together",
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.bg2,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border, width: 0.5),
            ),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ContactInfo()),
                      const SizedBox(width: 32),
                      Expanded(child: _ContactForm()),
                    ],
                  )
                : Column(
                    children: [
                      _ContactInfo(),
                      const SizedBox(height: 24),
                      _ContactForm(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Have a project in mind or want to collaborate? I'm always open to new opportunities.",
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textMuted,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 20),
        _ContactLink(icon: Icons.email_outlined, label: PortfolioData.email),
        const SizedBox(height: 8),
        _ContactLink(icon: Icons.code, label: PortfolioData.github),
        const SizedBox(height: 8),
        _ContactLink(icon: Icons.work_outline, label: PortfolioData.linkedin),
      ],
    );
  }
}

class _ContactLink extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ContactLink({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.bg3,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.accent2,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _msg = TextEditingController();

  InputDecoration _dec(String label) => InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(fontSize: 11, color: AppColors.textMuted),
    filled: true,
    fillColor: AppColors.bg3,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.accent, width: 1),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _name,
          style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
          decoration: _dec('NAME'),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _email,
          style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
          decoration: _dec('EMAIL'),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _msg,
          maxLines: 3,
          style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
          decoration: _dec('MESSAGE'),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Message sent! ✓')));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text('Send Message', style: TextStyle(fontSize: 13)),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _msg.dispose();
    super.dispose();
  }
}
