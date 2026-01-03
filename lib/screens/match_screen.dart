import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1116),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMatchHeader(),
                    _buildCompatibilityScore(),
                    _buildBreakdownCard(),
                    _buildWhyYouConnectedCard(),
                    _buildSharedIntentions(),
                    _buildConversationStarter(),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back, color: Colors.white),
          const Column(
            children: [
              Text("It's a Match",
                  style: TextStyle(
                      color: Color(0xFFFF4D80),
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text("Interaction Unlocked",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const Icon(Icons.more_vert, color: Color(0xFF9CA3AF)),
        ],
      ),
    );
  }

  Widget _buildMatchHeader() {
    return Column(
      children: [
        const SizedBox(height: 24),
        const CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCbm0muOwkFmBIhH1w44t5I0iJVHrdDViijXbSlhXytrTs19ahyNxIfxBxKXvvaysC5SFSPZzA8ydKk__RlAbHdWm6sqe5RwewaSzOkJNrg4X-ODcd1HQgN9jg2F8cScyYxyn5uSUcLQUf2OpZ6CB4mRklK69FzsaWZEdfx4srJZ14QkOgTXm2wbIMvrJ9d1OzVdEiDctLeCwN4nD7LaTzBMbIzmGwAo8vcycYJoAVhGlfN13jRL6ESM9-SLrzLdV5b4372JfSz5S0'),
        ),
        const SizedBox(height: 16),
        const Text("Sarah, 28",
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Color(0xFFFF4D80), size: 16),
            SizedBox(width: 4),
            Text("San Francisco, CA",
                style: TextStyle(color: Color(0xFF9CA3AF))),
          ],
        ),
      ],
    );
  }

  Widget _buildCompatibilityScore() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0x20FF4D80),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x4DFF4D80)),
            ),
            child: const Text("High Compatibility",
                style: TextStyle(
                    color: Color(0xFFFF4D80),
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          const Text("88%",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            "Your values on family and communication align perfectly.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF9CA3AF)),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("The Breakdown",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0x20FF4D80),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0x33FF4D80)),
                ),
                child: const Icon(Icons.analytics, color: Color(0xFFFF4D80)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildBreakdownItem("Core Values", 0.92),
          _buildBreakdownItem("Life Goals", 0.85),
          _buildBreakdownItem("Comm. Style", 0.88),
        ],
      ),
    );
  }

  Widget _buildBreakdownItem(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF9CA3AF))),
              Text("${(value * 100).toInt()}%",
                  style: const TextStyle(
                      color: Color(0xFFFF4D80), fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor:
                const AlwaysStoppedAnimation<Color>(Color(0xFFFF4D80)),
          ),
        ],
      ),
    );
  }

  Widget _buildWhyYouConnectedCard() {
    return Container(
      margin: const EdgeInsets.all(24),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBNbNZu8Lg8gjf5Qw0xy3BwENSkPgSprfWyEx9og_LDTepwG3Yh6YFbzOHjRKVqmq9RBDDwZxnZQt1zGIoNXbThaBM7yGNw0nM1N4KGHZiiHzRSCbFGWkaZrcaHb7NTWQaX3HuLAMNoscEbUIF_o3ONTHv9h-uQcEo3VkmrMhMYL5pRNoP_j_2cyGhBukEUJsvLSzLQbwbLkfPV6MZjj__MDEBmUzoQGr2AjYK5TJX67hPvIfkeBIIcoWADINMpUPhkuXz4FNRl16o'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Chip(
              label: Text("Why You Connected"),
              backgroundColor: Color(0x33FFFFFF),
              labelStyle: TextStyle(color: Colors.white, fontSize: 10),
            ),
            const SizedBox(height: 8),
            const Text("Architects of Adventure",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              "You both plan for the future but cherish spontaneity. Sarah wants to learn Italian—your listed hobby!",
              style: TextStyle(color: Color(0xFFE5E7EB)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedIntentions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Shared Intentions",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildIntentionChip("Long-term", Icons.favorite),
              _buildIntentionChip("Travel Buddy", Icons.flight),
              _buildIntentionChip("Dog Lover", Icons.pets),
              _buildIntentionChip("Foodie", Icons.restaurant),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIntentionChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, color: const Color(0xFFFF4D80)),
      label: Text(label),
      backgroundColor: const Color(0xFF1A1D26),
      labelStyle: const TextStyle(color: Color(0xFFE5E7EB)),
    );
  }

  Widget _buildConversationStarter() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D26),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0x20FF4D80),
            child: Icon(Icons.lightbulb, color: Color(0xFFFF4D80)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Conversation Starter",
                    style: TextStyle(
                        color: Color(0xFFFF4D80),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(
                  "\"Since you both love Italian food, ask her about the best pasta she's ever had in San Francisco.\"",
                  style: TextStyle(color: Color(0xFFE5E7EB)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.close),
              label: const Text("Pass"),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF9CA3AF),
                side: const BorderSide(color: Color(0x33FFFFFF)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble),
              label: const Text("Say Hello"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4D80),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
