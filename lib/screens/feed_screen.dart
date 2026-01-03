import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F12),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildFeedList(),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xCC0F0F12),
      pinned: true,
      floating: true,
      title: _buildAppBarTitle(),
      bottom: _buildFilterChips(),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4D6D), Colors.pink],
                ),
              ),
              child: const Icon(Icons.favorite, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Text(
              "Connect",
              style: TextStyle(
                color: Color(0xFFF2F2F5),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF18181C),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0x14FFFFFF)),
              ),
              child: const Text(
                "3/5 left today",
                style: TextStyle(
                  color: Color(0xFFF2F2F5),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBza9l7_l7DOtQKJCMuBGdzbjD4H9nwkgNhlKHfBCiKA4uqEH4wIARoYAZ8ktsqHlUZj3a9sYhDjM4s7ZVwKgEv01mT2YLN6SCYh0foB_L0cCNyJD-cjp0AbaUs401ckjyC5UbC23mZSgCyCwGa-_pAQ5GG3F-zvWRIfV6p7hTU-bIzmAeVP3D2Ybsw-M7tWHR_xQciy7cJp8UaGGlHNsMImwOye8pWseWUZoUkQu48fQ385a464VDaIWupMJSS3uzw1aKRK12bMm4'),
            ),
          ],
        )
      ],
    );
  }

  PreferredSize _buildFilterChips() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip("All", isSelected: true),
              _buildFilterChip("Thoughts"),
              _buildFilterChip("Experiences"),
              _buildFilterChip("Deep Questions"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor:
            isSelected ? const Color(0xFFFF4D6D) : const Color(0xFF18181C),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
          fontWeight: FontWeight.bold,
        ),
        side: isSelected
            ? BorderSide.none
            : const BorderSide(color: Color(0x14FFFFFF)),
      ),
    );
  }

  SliverList _buildFeedList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _buildThoughtCard(),
          _buildExperienceCard(),
          _buildDeepQuestionCard(),
          _buildEndOfFeed(),
        ],
      ),
    );
  }

  Widget _buildThoughtCard() {
    return Card(
      color: const Color(0xFF18181C),
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0x14FFFFFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuD1JAEVQevxD0FwS7-ZW0JI4KPZ0IuiyBN7gIqfbH5dfpN4TYqkUEDRttcmoykwE85mk8JHtLZxqwAwYwS0tioe3xVC0Tm9j9uaNPR20nBFztfVh428MUOYm86dDkh4N_FaKkPNpbUY_DycqiM_IiYAX_zLHO5aaO6wDmjBmlRg0iSwDB3hLrcKCl2ne3aIVmEhcW4E1RER7ZZ5zqewqHIGGzXdA31Ub5udWJoXDrHEqZljs2c4oSNKOflVYE29ZXSIvle9jmpU1Sk'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Elara",
                        style: TextStyle(
                            color: Color(0xFFF2F2F5),
                            fontWeight: FontWeight.bold)),
                    Text("Thought • 2h ago",
                        style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Sunday Rituals",
                style: TextStyle(
                    color: Color(0xFFF2F2F5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(height: 8),
            const Text(
              "I believe the perfect Sunday starts with silence and ends with jazz. It's the only day I refuse to look at a screen until noon. What’s your non-negotiable weekend ritual?",
              style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.psychology, color: Color(0xFFFF4D6D)),
                    label: const Text("Reflect",
                        style: TextStyle(color: Color(0xFFFF4D6D))),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0x33FF4D6D)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble, color: Colors.white),
                    label: const Text("Respond",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4D6D),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard() {
    return Card(
      color: const Color(0xFF18181C),
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0x14FFFFFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAPllZ1TkNaSQZNBzxnM7PaxB2VmWCwXRAuhmwN4RvDEC0SHM4Nruts3JuZoAlGqVCFjWFRN2a8Kit1jMnl1qA1yKq7EkULmTyHRE-aM1LORXx71lrK68W-aqzTanLwCCwzLURx0meHnZuBIPmIZKhS8GxbeVVx5vUPWQDyX3z3QZxy5PzjenRCjeGHO17ShghcbrXjGBfR3J_LH0BHwvn5mI_I-YmYCFO3_K_gUAU9vntMfzlnN0LLqzitbF3yfJ-B5nG5hdP635Q'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBWs6kxpVu5mZo10fIbCjJX8mmhzBzpPloZISIhuXSf68comxa_37DBfe7xkJB4B_2OedLlRZjK101alI9NTZODEUGge1elEDxnnF-o2c3xkghgVXioiAAYHnn9YJXiaxGSxRin-PTMSTU1-3w_klAJA_s7YVcawp8gQMzHF1XXAD9tq2qetVFCfKz8UClDwlhNZLsbbRmTTH1Ye9l8v_U0GJlpteilQh6fvZfObwaWuFHx9PRqdQyilvZqAACi1bAqSp3skeuEacc'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Finally conquered the trail. Looking for someone who isn't afraid of heights and loves an early start.",
                        style: TextStyle(color: Color(0xFF9CA3AF)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border,
                            color: Color(0xFF9CA3AF)),
                        label: const Text("Reflect",
                            style: TextStyle(color: Color(0xFF9CA3AF))),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0x14FFFFFF)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Respond"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D6D),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDeepQuestionCard() {
    return Card(
      color: const Color(0xFF18181C),
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0x14FFFFFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Chip(
              label: Text("Deep Question"),
              backgroundColor: Color(0x199333EA),
              labelStyle: TextStyle(color: Color(0xFFC084FC)),
            ),
            const SizedBox(height: 16),
            const Text(
              "\"What is a lesson you learned the hard way that you are now grateful for?\"",
              style: TextStyle(
                color: Color(0xFFF2F2F5),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBEOpqXOC5U4N_hlZDSRkBPfRjmQTJghJZ_9frFNKkathUjFDfLQ4y2FCtW9jGIaUMumWrT615p_WBVuaHEElgqiWLnwO64xylGUYK-p-1YHs6jLievMSsVmqlX0UPMUeNSjDJuWsNHzJH03nSmaQyzUeqUcmv5TuyTv69gP7zxeAwwHOieODMN7EgggIJVmlW_Mn7XWcC8whnSpHjBtJIBNSP0y_p_W-X43VpLqN7gG_Sn6I1gQRWjCXplXTRwQTOd8rAlkKgSXaE'),
                    ),
                    SizedBox(width: -10),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFF232328),
                      child: Text("+12", style: TextStyle(fontSize: 10)),
                    ),
                    SizedBox(width: 8),
                    Text("Reflected", style: TextStyle(color: Color(0xFF9CA3AF))),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.black),
                  label:
                      const Text("Respond", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEndOfFeed() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        children: const [
          Icon(Icons.bedtime, color: Color(0xFF9CA3AF), size: 32),
          SizedBox(height: 8),
          Text(
            "That's all for now. \nMeaningful connections take time.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF9CA3AF)),
          ),
        ],
      ),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text("Share"),
      icon: const Icon(Icons.edit_note),
      backgroundColor: const Color(0xFFFF4D6D),
    );
  }
}
