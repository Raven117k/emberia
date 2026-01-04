import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B10),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 110),
                    child: Column(
                      children: [
                        _photoSection(),
                        _privacySlider(),
                        _basicsSection(),
                        _promptsSection(),
                        _valuesSection(),
                        _privacySection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Transparent header overlayed on top of the photo section only for this screen
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _header(),
                ),
              ),
            ),

            _saveButton(context),
          ],
        ),
      ),
    );
  }

  /* ================= HEADER ================= */

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.transparent,
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  /* ================= PHOTO ================= */

  Widget _photoSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 260,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBB6yiw2Pt-q7CtfZ886JwrbRM-MmOfPf6oKMXSEP9UnC2ukdckO_NWs_0FVBYraL4EhLPfhju79o058jcg7HKInwFIKjhPnZl6TUYHq7M9aDR1Yvqx-RmMhEtfP5GEmKL3g0L_vsZZYdDhH61eoi4-oLJkwwbXLRNZjT7D2vLJdmHMG40vfTMJH1p_N6uroAW8qRUlsnva9oemXaSRM6adYUygKkYPPTOVeAAi5sh3i8YdNNOLszEX64eonAepyAmRsZ_ymxHuElE'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                shape: BoxShape.circle,
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, color: Colors.white),
                  SizedBox(height: 4),
                  Text(
                    'Change Photo',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* ================= PRIVACY SLIDER ================= */

  Widget _privacySlider() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF16161D),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.blur_on, color: Colors.white70, size: 18),
              SizedBox(width: 8),
              Text('Privacy Blur Level',
                  style: TextStyle(color: Colors.white70)),
              Spacer(),
              Text('15%', style: TextStyle(color: Color(0xFFE85B78))),
            ],
          ),
          Slider(
            value: 0.15,
            onChanged: (_) {},
            activeColor: const Color(0xFFE85B78),
            inactiveColor: Colors.white24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Clear', style: TextStyle(color: Colors.white38)),
              Text('Mystery', style: TextStyle(color: Colors.white38)),
            ],
          ),
        ],
      ),
    );
  }

  /* ================= BASICS ================= */

  Widget _basicsSection() {
    return _section(
      'THE BASICS',
      Column(
        children: [
          _inputTile('Display Name', 'Adrian', verified: true),
          Row(
            children: [
              Expanded(child: _inputTile('Age', '28', locked: true)),
              const SizedBox(width: 12),
              Expanded(child: _inputTile('Location', 'San Francisco')),
            ],
          ),
          _inputTile('Connection Style / Identity', 'Demisexual'),
        ],
      ),
    );
  }

  /* ================= PROMPTS ================= */

  Widget _promptsSection() {
    return _section(
      'PROFILE PROMPTS',
      Column(
        children: [
          _promptCard(
            'I FEEL MOST CONNECTED WHEN…',
            'We can sit in silence together without checking our phones, just enjoying the shared space.',
            public: true,
          ),
          _promptCard(
            'A NON-NEGOTIABLE IS…',
            'Active listening. I value deep conversations over small talk and need a partner who is present.',
            public: false,
          ),
        ],
      ),
    );
  }

  /* ================= VALUES ================= */

  Widget _valuesSection() {
    return _section(
      'VALUES & INTERESTS',
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _tag('Growth Mindset'),
          _tag('Art History'),
          _tag('Nature'),
          _tag('Empathy'),
          _addTag(),
        ],
      ),
    );
  }

  /* ================= PRIVACY ================= */

  Widget _privacySection() {
    return _section(
      'PRIVACY & VISIBILITY',
      Column(
        children: [
          _switchTile(
            'Incognito Mode',
            'Only visible to people you’ve liked',
            false,
          ),
          _switchTile(
            'Allow Direct Messages',
            'From verified profiles only',
            true,
          ),
        ],
      ),
    );
  }

  /* ================= SAVE ================= */

  Widget _saveButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF0B0B10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE85B78),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {},
          child: const Text(
            'Save Changes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  /* ================= REUSABLE ================= */

  Widget _section(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _inputTile(String label, String value,
      {bool verified = false, bool locked = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A22),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white38)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          if (verified)
            const Icon(Icons.verified, color: Colors.green, size: 18),
          if (locked) const Icon(Icons.lock, color: Colors.white38, size: 18),
        ],
      ),
    );
  }

  Widget _promptCard(String title, String text, {required bool public}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A22),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Color(0xFFE85B78),
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(text,
              style: const TextStyle(color: Colors.white70, height: 1.4)),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(public ? Icons.public : Icons.lock,
                    color: Colors.white38, size: 14),
                const SizedBox(width: 4),
                Text(public ? 'Public' : 'Matches Only',
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget _tag(String text) => Chip(
        label: Text(text),
        backgroundColor: Color(0xFF1A1A22),
        labelStyle: TextStyle(color: Colors.white),
      );

  static Widget _addTag() => Chip(
        label: Text('+ Add Topic'),
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Colors.white24),
        labelStyle: TextStyle(color: Colors.white38),
      );

  Widget _switchTile(String title, String subtitle, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A22),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.white38)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: (_) {},
            activeColor: const Color(0xFFE85B78),
          ),
        ],
      ),
    );
  }
}
