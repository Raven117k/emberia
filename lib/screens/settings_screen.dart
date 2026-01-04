import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool dailyLimit = true;
  bool quietHours = false;
  bool conversationCoach = true;
  bool personalityAnalysis = false;
  bool incognito = false;
  bool readReceipts = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B10),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              _header(),
              _sectionTitle('ACCOUNT & SECURITY'),
              _card([
                _navTile(Icons.phone_android, 'Phone Number',
                    '+1 (555) ••••99'),
                _divider(),
                _navTile(Icons.email, 'Email Address',
                    'adrian@example.com',
                    trailing: _verified()),
                _divider(),
                _switchlessTile(
                    Icons.shield, 'Two-Factor Auth', 'Recommended for safety',
                    trailingText: 'Off'),
              ]),
              _sectionTitle('MINDFUL INTERACTION', icon: Icons.spa),
              _card([
                _switchTile(
                  Icons.favorite,
                  'Daily Connection Limit',
                  'Limit new matches to 3 per day to encourage meaningful conversation.',
                  dailyLimit,
                  (v) => setState(() => dailyLimit = v),
                ),
                _divider(),
                _switchTile(
                  Icons.nights_stay,
                  'Quiet Hours',
                  'Pause notifications from 10 PM to 8 AM.',
                  quietHours,
                  (v) => setState(() => quietHours = v),
                ),
              ]),
              _sectionTitle('AI ASSISTANT'),
              _card([
                _switchTile(
                  Icons.chat_bubble,
                  'Conversation Coach',
                  'Real-time tone suggestions',
                  conversationCoach,
                  (v) => setState(() => conversationCoach = v),
                ),
                _divider(),
                _switchTile(
                  Icons.psychology,
                  'Personality Analysis',
                  'Compatibility insights on profiles',
                  personalityAnalysis,
                  (v) => setState(() => personalityAnalysis = v),
                ),
              ]),
              _sectionTitle('PRIVACY CONTROLS'),
              _card([
                _switchTile(
                  Icons.visibility_off,
                  'Incognito Mode',
                  'Only show me to people I like',
                  incognito,
                  (v) => setState(() => incognito = v),
                ),
                _divider(),
                _navTile(Icons.block, 'Blocked Users',
                    'Manage your block list'),
                _divider(),
                _switchTile(
                  Icons.done_all,
                  'Read Receipts',
                  'Let others see when you’ve read messages',
                  readReceipts,
                  (v) => setState(() => readReceipts = v),
                ),
              ]),
              _sectionTitle('DATA & LEGAL'),
              _card([
                _navTile(Icons.download, 'Download My Data', ''),
                _divider(),
                _navTile(Icons.open_in_new, 'Privacy Policy', ''),
                _divider(),
                _dangerTile(Icons.delete, 'Delete Account'),
              ]),
              const SizedBox(height: 20),
              _logoutButton(),
              const SizedBox(height: 16),
              const Text(
                'VERSION 2.4.1 (BUILD 890)',
                style: TextStyle(color: Colors.white24, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* ================= HEADER ================= */

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: const [
          Icon(Icons.arrow_back, color: Colors.white),
          Spacer(),
          Text(
            'App Settings',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Spacer(),
        ],
      ),
    );
  }

  /* ================= SECTIONS ================= */

  Widget _sectionTitle(String title, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(icon, color: const Color(0xFFE15978), size: 16),
            ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF171721),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(children: children),
    );
  }

  Widget _divider() => const Divider(
        height: 1,
        color: Colors.white12,
        indent: 56,
      );

  /* ================= TILES ================= */

  Widget _navTile(IconData icon, String title, String subtitle,
      {Widget? trailing}) {
    return ListTile(
      leading: _icon(icon),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle,
              style: const TextStyle(color: Colors.white54))
          : null,
      trailing:
          trailing ?? const Icon(Icons.chevron_right, color: Colors.white38),
      onTap: () {},
    );
  }

  Widget _switchlessTile(IconData icon, String title, String subtitle,
      {String? trailingText}) {
    return ListTile(
      leading: _icon(icon),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
      subtitle:
          Text(subtitle, style: const TextStyle(color: Colors.white54)),
      trailing: Text(trailingText ?? '',
          style: const TextStyle(color: Colors.white38)),
    );
  }

  Widget _switchTile(IconData icon, String title, String subtitle, bool value,
      ValueChanged<bool> onChanged) {
    return ListTile(
      leading: _icon(icon),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
      subtitle:
          Text(subtitle, style: const TextStyle(color: Colors.white54)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFE15978),
      ),
    );
  }

  Widget _dangerTile(IconData icon, String title) {
    return ListTile(
      leading: _icon(icon, danger: true),
      title: Text(title,
          style:
              const TextStyle(color: Color(0xFFE15978), fontSize: 15)),
      onTap: () {},
    );
  }

  Widget _icon(IconData icon, {bool danger = false}) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.black.withOpacity(0.3),
      child: Icon(icon,
          color: danger ? const Color(0xFFE15978) : Colors.white70,
          size: 18),
    );
  }

  Widget _verified() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text('Verified',
          style: TextStyle(color: Colors.green, fontSize: 12)),
    );
  }

  /* ================= LOGOUT ================= */

  Widget _logoutButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, color: Colors.white70),
        label: const Text('Log Out',
            style: TextStyle(color: Colors.white70)),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white12),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
