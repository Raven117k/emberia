// ignore_for_file: unused_local_variable

import 'package:app/screens/onboarding_philosophy_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              _buildLogo(context),
              const SizedBox(height: 40),
              _buildTitle(context),
              const SizedBox(height: 20),
              _buildForm(context),
              const SizedBox(height: 20),
              _buildSocialButtons(context),
              const SizedBox(height: 20),
              _buildFooterText(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0x77161518), // Kept as is, as it's a specific glass effect
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Icon(
        Icons.favorite_border,
        color: theme.colorScheme.primary,
        size: 40,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Connect with intention',
          style: theme.textTheme.displayLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Meaningful connections, designed for you.',
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xBB161518), // Kept as is, as it's a specific glass effect
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          _buildTabs(context),
          const SizedBox(height: 24),
          _buildPhoneInput(context),
          const SizedBox(height: 24),
          _buildContinueButton(context),
          const SizedBox(height: 16),
          _buildPrivacyText(context),
        ],
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Center(
                child: Text(
                  'Phone',
                  style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Email',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneInput(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            'PHONE NUMBER',
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1C20), // Specific input color
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text(
                      'US +1',
                      style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: theme.textTheme.bodyMedium?.color,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 1,
                height: 30,
                color: Colors.white.withOpacity(0.1),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 18),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '(555) 000-0000',
                    hintStyle: theme.textTheme.bodyLarge?.copyWith(color: const Color(0xFF6B7280)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OnboardingPhilosophyScreen(),
            ),
          );
        },
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Continue securely',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: theme.colorScheme.onPrimary)
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyText(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock, color: theme.colorScheme.primary.withOpacity(0.8), size: 16),
        const SizedBox(width: 8),
        Text(
          'Private & Secure. No public posts.',
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
        )
      ],
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'OR CONTINUE WITH',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildSocialButton(context, 'Google')),
            const SizedBox(width: 16),
            Expanded(child: _buildSocialButton(context, 'Apple')),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, String type) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (type == 'Google')
              Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuBpSLm6XAnTV5L9yRjS7kLowsvXeMEdCAbTqXyp2ze3CVtMNXZgyFIWLPUw7PylMb8o4oRExpIEwGucAdBNW62eQg0mYLM0c4FikgL7591tpqslsyJrNykYeTKWUUcn8MlGOzflxUKaUeKPbSMp95UtJirc52ufeX_zTBKDmIh2Vqm9R-Ws-sPVvRotFZ-5UjmrWTxmoE9Jbu5Oy982ZW7h8yXybPPM1AgHlxgrW15rcquN9v1uHXZhdKhj7Ry5f_xaBQ183ei0dAI', width: 20)
            else
              const Icon(Icons.apple, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              type,
              style: theme.textTheme.labelLarge?.copyWith(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFooterText(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 11),
        children: [
          const TextSpan(text: 'By continuing, you agree to our '),
          TextSpan(
            text: 'Terms of Service',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
