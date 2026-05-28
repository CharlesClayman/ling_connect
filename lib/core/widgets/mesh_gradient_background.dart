import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MeshGradientBackground extends StatefulWidget {
  final Widget child;

  const MeshGradientBackground({super.key, required this.child});

  @override
  State<MeshGradientBackground> createState() => _MeshGradientBackgroundState();
}

class _MeshGradientBackgroundState extends State<MeshGradientBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(color: AppTheme.surface),
          // Animated Blobs
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    top: -100 + (100 * _animation.value),
                    left: -100 - (50 * _animation.value),
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primary.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -150 - (50 * _animation.value),
                    right: -100 + (100 * _animation.value),
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.accent.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Blur Layer over blobs
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Content
          SafeArea(child: widget.child),
        ],
      ),
    );
  }
}

