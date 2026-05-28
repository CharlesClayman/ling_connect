import 'package:flutter/material.dart';
import '../../../../core/widgets/mesh_gradient_background.dart';
import '../../../../core/widgets/glass_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: MeshGradientBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            padding: const EdgeInsets.only(top: 120),
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Alex Mitchell',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    _SettingsTile(
                      icon: Icons.language_rounded,
                      title: 'App Language',
                      subtitle: 'English',
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white12, height: 1),
                    _SettingsTile(
                      icon: Icons.translate_rounded,
                      title: 'Translation Preferences',
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white12, height: 1),
                    _SettingsTile(
                      icon: Icons.notifications_none_rounded,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white12, height: 1),
                    _SettingsTile(
                      icon: Icons.shield_outlined,
                      title: 'Privacy & Security',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    _SettingsTile(
                      icon: Icons.help_outline_rounded,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white12, height: 1),
                    _SettingsTile(
                      icon: Icons.logout_rounded,
                      title: 'Sign Out',
                      titleColor: Colors.redAccent,
                      iconColor: Colors.redAccent,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Color iconColor;
  final Color titleColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.iconColor = Colors.white70,
    this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: TextStyle(color: titleColor, fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle!, style: const TextStyle(color: Colors.white54)) : null,
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.white54),
      onTap: onTap,
    );
  }
}
