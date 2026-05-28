import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/mesh_gradient_background.dart';
import '../../../../core/widgets/glass_card.dart';

class LanguageOnboardingPage extends StatelessWidget {
  const LanguageOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MeshGradientBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const Icon(
              Icons.language_rounded,
              size: 80,
              color: AppTheme.primary,
            ),
            const SizedBox(height: 32),
            Text(
              'Welcome to PolyTalk AI',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Connect with the world in your preferred language using real-time AI translation.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            GlassCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _LanguageTile(title: 'English (US)', isSelected: true),
                  const Divider(color: Colors.white24, height: 1),
                  _LanguageTile(title: 'Spanish (ES)', isSelected: false),
                  const Divider(color: Colors.white24, height: 1),
                  _LanguageTile(title: 'French (FR)', isSelected: false),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/auth');
              },
              child: const Text('Continue'),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _LanguageTile({
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle_rounded, color: AppTheme.primary)
          : null,
      onTap: () {},
    );
  }
}
