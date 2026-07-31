import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/Core/theme/app_theme.dart';
import 'package:my_portfolio/Core/theme/portfolio_data.dart';
import 'package:my_portfolio/Core/theme/app_animations.dart';
import 'package:my_portfolio/Core/widgets/shared_widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 28,
        vertical: AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: '// contact',
            title: "Let's work together",
          ),
          AnimateOnScroll(
            child: Container(
              padding: EdgeInsets.all(isWide ? 32 : 24),
              decoration: BoxDecoration(
                color: AppColors.bg2,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.border, width: 0.5),
              ),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _ContactInfo()),
                        const SizedBox(width: 40),
                        Expanded(child: _ContactForm()),
                      ],
                    )
                  : Column(
                      children: [
                        _ContactInfo(),
                        const SizedBox(height: 28),
                        _ContactForm(),
                      ],
                    ),
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
        Text(
          "Have a project in mind or want to collaborate?\n"
          "I'm always open to new opportunities.",
          style: AppTextStyles.body,
        ),
        const SizedBox(height: 24),
        _ContactLink(
          icon: Icons.email_outlined,
          label: PortfolioData.email,
          url: 'mailto:${PortfolioData.email}',
        ),
        const SizedBox(height: 10),
        _ContactLink(
          icon: FontAwesomeIcons.github,
          label: 'GitHub',
          url: PortfolioData.github,
        ),
        const SizedBox(height: 10),
        _ContactLink(
          icon: FontAwesomeIcons.linkedin,
          label: 'LinkedIn',
          url: PortfolioData.linkedin,
        ),
        const SizedBox(height: 24),
        // Download CV button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // On web, this would trigger a download
              // On mobile, we can show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('CV download available on web version'),
                  backgroundColor: AppColors.bg3,
                ),
              );
            },
            icon: const Icon(Icons.download_rounded, size: 16),
            label: const Text('Download CV'),
          ),
        ),
      ],
    );
  }
}

class _ContactLink extends StatefulWidget {
  final dynamic icon;
  final String label;
  final String url;
  const _ContactLink({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
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
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.bg3 : AppColors.bgElevated,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(
              color: _hovered ? AppColors.accent : AppColors.border,
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.accent.withAlpha(15),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Center(
                  child: widget.icon is IconData
                      ? Icon(
                          widget.icon as IconData,
                          size: 14,
                          color: AppColors.accent,
                        )
                      : FaIcon(
                          widget.icon as FaIconData,
                          size: 14,
                          color: AppColors.accent,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: _hovered
                        ? AppColors.textPrimary
                        : AppColors.textMuted,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: _hovered ? AppColors.accent : AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _msg = TextEditingController();
  bool _sending = false;
  bool _sent = false;

  void _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);

    // Build mailto URI as fallback
    final subject = Uri.encodeComponent('Portfolio Contact from ${_name.text}');
    final body = Uri.encodeComponent(
      'Name: ${_name.text}\nEmail: ${_email.text}\n\n${_msg.text}',
    );
    final mailtoUrl =
        'mailto:${PortfolioData.email}?subject=$subject&body=$body';

    try {
      await launchUrl(Uri.parse(mailtoUrl));
      setState(() {
        _sending = false;
        _sent = true;
      });
      _name.clear();
      _email.clear();
      _msg.clear();

      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) setState(() => _sent = false);
      });
    } catch (_) {
      setState(() => _sending = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open email client'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_sent) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.accent2.withAlpha(20),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.accent2,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Message Ready!',
              style: AppTextStyles.subheading.copyWith(
                color: AppColors.accent2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your email client should have opened.',
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
            decoration: const InputDecoration(labelText: 'NAME'),
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _email,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
            decoration: const InputDecoration(labelText: 'EMAIL'),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your email';
              if (!v.contains('@')) return 'Please enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _msg,
            maxLines: 4,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
            decoration: const InputDecoration(
              labelText: 'MESSAGE',
              alignLabelWithHint: true,
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter a message' : null,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _sending ? null : _sendMessage,
              child: _sending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Send Message'),
            ),
          ),
        ],
      ),
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
