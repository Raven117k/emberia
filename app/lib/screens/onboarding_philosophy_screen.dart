import 'package:app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class OnboardingPhilosophyScreen extends StatelessWidget {
  const OnboardingPhilosophyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.9),
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            centerTitle: true,
            title: Text(
              'Our Philosophy',
              style: theme.textTheme.titleLarge,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildHeader(context),
                _buildBadge(context),
                const SizedBox(height: 32),
                _buildCorePrinciples(context),
                const SizedBox(height: 32),
                _buildQuote(context),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 440,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAxNmFBaCqrgi7uGHthSDS0yhbismyxNxKIlVOAVSR66-ngeuN9LQ0Rrw6XOOkdp_tOour2lOnZAndbxTIs9sbTtFYdNPrkNvvL5IPd6pAO_CMjD0dVqymXOtMU3C4MA3NQbKQxOwNIP7YUQHSAd7TLVHWtr2PfOhP5Wa9WVbU4k-Gjj3IhOTv23o6Zye4pemBVeNFQHxhD3smbcFtDZJWySJR_SqpKsJPQTIQG2SlmBdGkoGcYLTQ6BGtMfQ_sgCDVcHhzX-MN2bg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Intention over Attention.',
            textAlign: TextAlign.center,
            style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          Text(
            'Welcome to a space designed for meaningful cadence, not rapid consumption.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    final theme = Theme.of(context);
    return Transform.translate(
      offset: const Offset(0, -28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: -2,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.verified_user, color: theme.colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              '0% SWIPING / 100% INTENTIONAL',
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCorePrinciples(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Core Principles',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'How we cultivate depth in a shallow world.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          _buildPrincipleItem(
            context,
            icon: Icons.favorite_border,
            title: 'No Pressure',
            subtitle:
                'No swiping endlessly. We believe in slow dating and deep compatibility.',
          ),
          const SizedBox(height: 16),
          _buildPrincipleItem(
            context,
            icon: Icons.diversity_1,
            title: 'Authentic Connection',
            subtitle:
                'Match through shared activities and conversation prompts, not just photos.',
          ),
          const SizedBox(height: 16),
          _buildPrincipleItem(
            context,
            icon: Icons.lock_person,
            title: 'Privacy & Control',
            subtitle:
                'Your data stays yours. You decide who sees your profile and when to engage.',
          ),
        ],
      ),
    );
  }

  Widget _buildPrincipleItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuote(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '"Finally, a place to breathe."',
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            theme.scaffoldBackgroundColor,
            theme.scaffoldBackgroundColor.withOpacity(0.95),
            theme.scaffoldBackgroundColor.withOpacity(0),
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.4),
              blurRadius: 25,
              spreadRadius: -5,
            )
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: theme.textTheme.labelLarge?.copyWith(color: theme.scaffoldBackgroundColor),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: theme.scaffoldBackgroundColor),
            ],
          ),
        ),
      ),
    );
  }
}
