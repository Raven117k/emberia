import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E13),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildAppBar(),
              _buildProfileContent(),
            ],
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 400.0,
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBB6yiw2Pt-q7CtfZ886JwrbRM-MmOfPf6oKMXSEP9UnC2ukdckO_NWs_0FVBYraL4EhLPfhju79o058jcg7HKInwFIKjhPnZl6TUYHq7M9aDR1Yvqx-RmMhEtfP5GEmKL3g0L_vsZZYdDhH61eoi4-oLJkwwbXLRNZjT7D2vLJdmHMG40vfTMJH1p_N6uroAW8qRUlsnva9oemXaSRM6adYUygKkYPPTOVeAAi5sh3i8YdNNOLszEX64eonAepyAmRsZ_ymxHuElE'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xFF0F0E13),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
      leading: _buildAppBarButton(Icons.arrow_back),
      actions: [_buildAppBarButton(Icons.settings)],
    );
  }

  Widget _buildAppBarButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.4),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  SliverToBoxAdapter _buildProfileContent() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF0F0E13),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildReputationScore(),
            const SizedBox(height: 24),
            _buildAboutMeSection(),
            const SizedBox(height: 24),
            _buildValuesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Adrian, 28",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Color(0xFFE15978), size: 16),
                SizedBox(width: 4),
                Text("San Francisco, CA",
                    style: TextStyle(color: Color(0xFF9CA3AF))),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE15978)),
              ),
              child: const Text("Demisexual",
                  style: TextStyle(
                      color: Color(0xFFE15978), fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 4),
            const Text("Connection Style",
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
          ],
        )
      ],
    );
  }

  Widget _buildReputationScore() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1A26),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: 0.92,
              strokeWidth: 3,
              backgroundColor: Color(0x0DFFFFFF),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE15978)),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Reputation Score",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text("High responsiveness & respect",
                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
              ],
            ),
          ),
          _buildBadge(Icons.verified_user, const Color(0xFF22C55E)),
          const SizedBox(width: 8),
          _buildBadge(Icons.chat_bubble, const Color(0xFF3B82F6)),
        ],
      ),
    );
  }

  Widget _buildBadge(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildAboutMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("About Me",
            style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        const SizedBox(height: 16),
        _buildAboutCard(
            "I feel most connected when...",
            "We can sit in silence together without checking our phones, just enjoying the shared space.",
            const Color(0xFFE15978)),
        const SizedBox(height: 16),
        _buildAboutCard(
            "A non-negotiable is...",
            "Active listening. I value deep conversations over small talk and need a partner who is present.",
            Colors.pink.shade400),
      ],
    );
  }

  Widget _buildAboutCard(String title, String content, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1A26),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildValuesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Values & Interests",
            style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildValueChip("Growth Mindset", Icons.psychology),
            _buildValueChip("Art History", Icons.palette),
            _buildValueChip("Nature", Icons.hiking),
            _buildValueChip("Empathy", Icons.volunteer_activism),
            _buildValueChip("Add", Icons.add, isAddButton: true),
          ],
        )
      ],
    );
  }

  Widget _buildValueChip(String label, IconData icon,
      {bool isAddButton = false}) {
    return Chip(
      avatar: Icon(icon,
          color: isAddButton ? const Color(0xFF9CA3AF) : const Color(0xFFE15978)),
      label: Text(label),
      backgroundColor: const Color(0xFF1C1A26),
      labelStyle: TextStyle(
          color: isAddButton ? const Color(0xFF9CA3AF) : Colors.white),
      side: BorderSide(
          color: isAddButton
              ? const Color(0x33FFFFFF)
              : Colors.white.withOpacity(0.05)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            style: isAddButton ? BorderStyle.solid : BorderStyle.none,
            color: Colors.transparent),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xDD1C1A26),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  SizedBox(width: 8),
                  CircleAvatar(
                      radius: 5, backgroundColor: Color(0xFF22C55E)),
                  SizedBox(width: 8),
                  Text("Profile Visible",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, color: Color(0xFF9CA3AF)),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE15978),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
