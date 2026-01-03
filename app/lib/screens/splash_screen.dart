import 'dart:async';
import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF1e0a12),
              Colors.black,
            ],
            center: Alignment.topCenter,
            radius: 1.5,
          ),
        ),
        child: Stack(
          children: [
            // Animated Blobs
            _buildAnimatedBlob(
              color: const Color(0x33E11D48),
              top: -100,
              left: -100,
              duration: const Duration(seconds: 10),
            ),
            _buildAnimatedBlob(
              color: const Color(0x4DE11D48),
              bottom: -150,
              right: -150,
              duration: const Duration(seconds: 12),
              delay: 4,
            ),
            // Main Content
            FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGlassLogo(),
                    const SizedBox(height: 48),
                    _buildTitleText(),
                    const SizedBox(height: 20),
                    _buildSubtitleText(),
                  ],
                ),
              ),
            ),
            // Bottom Icon
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 64.0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Icon(
                    Icons.all_inclusive,
                    color: Color(0x66E11D48),
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedBlob({
    required Color color,
    double? top,
    double? bottom,
    double? left,
    double? right,
    required Duration duration,
    int delay = 0,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: AnimatedContainer(
        duration: duration,
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  Widget _buildGlassLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0x661E0A14),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDAAOEBmWubgXZf8L7BhN-DHK01D4vNVYKmEjYQkzvK8smENZVzDdZLAv2lThratdHP9scVgqlW2exYlvJu6D3iYarxBmgiP8VBBxs5nVEPVcV0UskxPA0AeG3wq3fDslXIz92e9YhJOO3fAOvCdpsawKLKbw4pw3S-r79AnEyyHd595Hashghz5twaiP35CnYrVMlGrd9POsDZQsFgCYLYp8dQoShRvK_oj1enKJXgzD6flzciTF7pTKV-1orzaPkVmGMPiJtXXro'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return const Text(
      'Intention',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildSubtitleText() {
    return Text(
      'Connections with intention',
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFB7185).withOpacity(0.6),
        letterSpacing: 4,
        ),
    );
  }
}
