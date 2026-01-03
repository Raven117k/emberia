import 'package:flutter/material.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: CustomScrollView(
        slivers: [
          _buildHeader(),
          _buildDailySuggestions(),
          _buildSharedExperiences(),
          _buildMatchActivity(),
        ],
      ),
    );
  }

  SliverAppBar _buildHeader() {
    return const SliverAppBar(
      backgroundColor: Color(0xFF09090B),
      expandedHeight: 120.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 16, bottom: 16),
        title: Text(
          "Good evening,\nAlex",
          style: TextStyle(
            color: Color(0xFFFAFAFA),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuATq1D10kdlkPQhy4DU7NGwb_xLc_e15TAyYdg-Cum0v6t286oEsfFkx5PzsG4w1Lp8bj31RWygUGt3yvO3Eao5XLC1HqgohQW2Lomjz27aCE4TPqMFQErg984tj3Lfv5H1lgPsDNsUJ4Gxs1itJGNJVRQ7F7QOkK963mSb98Yd-7J81pgnaNqmjrgaAjFh820njHyml_MUD50CRPTNt8u4xDFUmABj8lUbce_QevIkOtYBinmScKRIUoFnZXLSd1JkvqbQDcb5LbI'),
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildDailySuggestions() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Daily Suggestions",
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Chip(
                  label: const Text("3 Matches"),
                  backgroundColor: const Color(0x26EC4899),
                  labelStyle: const TextStyle(color: Color(0xFFEC4899)),
                  side: const BorderSide(color: Color(0x33EC4899)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSuggestionCard(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBXQZTu9H1TTVnwproLLiXVEkoTMUWgJd5xevx-BC1roVBeIGqEqWLBHn8h0C5sO7NxpLZWztJz-4CFx5OA-xiF9Y77MO8RIjN5Yk4ewvtBiuL3P7VFoiBkaZjNYvVrCFLZdp2kXU9bP5SlXvXWRh6OqUop9jOYSBdKuj4TB0jDQZdrgmDbEnj9VxlhLJmtxsTIKGb_aZAyiM8huife0HvLyKNXBcr9u3DI8E0zeKuTInS9avpEXVYWJQnrkUFhvvgKom_LshM6Njw',
              title: "The Quiet Adventurer",
              description:
                  "Graphic designer by day, stargazer by night. Seeking meaningful silence and loud laughter.",
              tags: ["Sci-Fi", "Ramen", "Travel"],
              matchPercentage: "92%",
              buttonText: "Open Conversation",
              buttonIcon: Icons.favorite,
              isPrimaryButton: true,
            ),
            const SizedBox(height: 16),
            _buildSuggestionCard(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCnOV84Rviw2st55Z-XHPTR3C0zgWpvfAQB5KIwinUfN3DdtmOjT2VzmI8IfBBvKO8-2dyxIiurGIIUmO4-6H7-tkWx6axUbNX0YlqBWCRVa-stpoezVIGjLwe7169GYKZCiV4hRXSk4y-gdJ4QH2Nekm-406BylOxxnRnrFvkIb6fA8EU8Djzxoz7IEliFWqjaNSj2--gV9v9nIpOXINp-T1gxWIjOeoaWf8oaDSpoFBiRa_62bk3e3WiEHk6jKaShHrNqTzjiBTU',
              title: "The Art Enthusiast",
              description:
                  "Curator of small moments. I believe the best dates happen in museums or hole-in-the-wall cafes.",
              tags: ["Modernism", "Hiking", "Coffee"],
              matchPercentage: "78%",
              buttonText: "View Profile",
              buttonIcon: Icons.visibility,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionCard({
    required String imageUrl,
    required String title,
    required String description,
    required List<String> tags,
    required String matchPercentage,
    required String buttonText,
    required IconData buttonIcon,
    bool isPrimaryButton = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFF09090B),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFFA1A1AA),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  children: tags
                      .map((tag) => Chip(
                            label: Text(tag),
                            backgroundColor: const Color(0x8027272A),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFAFAFA)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(buttonIcon),
                    label: Text(buttonText),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: isPrimaryButton
                          ? const Color(0xFF09090B)
                          : const Color(0xFFFAFAFA),
                      backgroundColor:
                          isPrimaryButton ? Colors.white : const Color(0xFFEC4899),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSharedExperiences() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Today's Shared Experiences",
              style: TextStyle(
                color: Color(0xFFFAFAFA),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              children: [
                _buildExperienceCard(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBTrQ2QQdWhjPIGvrRoHgwxCl7oIxiLcRkbvGApWyux2WYxtwfB7z-2VA7KFrKwjN9pnbSdxaYtLsExbHPm7pOwCYNddgTCBwMYWBSsf0ht3F_47uu5KT-i1UBHWH6zKmXPXJeLVIuYibIzdI5e8zxcuBPYbnYyj1_ag79gNBjtT3fW2c3un0Tvs-OWFl_OBnSQ3495wjKTsnudsLDuJdhRt-PH6LZfjpWArFlLvCsFSenjsrYEemOPFRuE_NaLe6gH8a7QJprptb8',
                  title: "Jazz Night at Blue Note",
                  subtitle: "Tomorrow • 8:00 PM",
                ),
                const SizedBox(width: 16),
                _buildExperienceCard(
                  imageUrl:
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBpWlz3HCuAuhWOiiCoyfDHKu_0bdfNRCFzpx08EffR3QkRx05RDN7acK3UBF3VzhoRhpTTp_ao4LArGtwYN08LBTdeeMPTv0nmD1sevvjLGvD19-hga1X36qYW1yoCgBhZ3JV7sZx6T6EubVOpodErWpwd3p1XYvpBeJFII7Etx9xljZDvH913vv25Y3VCmxwr7UHm4J9AcdY5K4XSI4arDJl3hJxWk-UuqGKFV0-bDivV9828HUDQXJZZT2Z9o-arM2Ktk2KDAWs',
                  title: "Pottery Workshop",
                  subtitle: "Sat, Oct 28 • 2:00 PM",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFFA1A1AA),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildMatchActivity() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Match Activity",
              style: TextStyle(
                color: Color(0xFFFAFAFA),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF18181B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Column(
                children: [
                  _buildActivityItem(
                    icon: Icons.menu_book,
                    title: "Jordan updated their reading list",
                    subtitle: "2 hours ago",
                  ),
                  Divider(color: Colors.white.withOpacity(0.05)),
                  _buildActivityItem(
                    icon: Icons.edit,
                    title: "Casey answered a prompt",
                    subtitle: "'A perfect Sunday morning...'",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0x26EC4899),
        child: Icon(icon, color: const Color(0xFFEC4899), size: 20),
      ),
      title: Text(title, style: const TextStyle(color: Color(0xFFFAFAFA))),
      subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFFA1A1AA))),
      trailing:
          const Icon(Icons.chevron_right, color: Color(0xFFA1A1AA)),
    );
  }

}
