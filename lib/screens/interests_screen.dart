import 'package:app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _selectedValues = ["Empathy", "Curiosity", "Wellness"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0E13),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                _buildAppBar(),
                _buildHeader(),
                _buildTabs(),
                _buildGrid(),
              ],
            ),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFF0F0E13),
      pinned: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          const Text("Step 3 of 5",
              style: TextStyle(
                  color: Color(0xFFE14D74),
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: () {},
            child: const Text("Skip",
                style: TextStyle(color: Color(0x66FFFFFF))),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: List.generate(
              5,
              (index) => Expanded(
                child: Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: index < 3
                        ? const Color(0xFFE14D74)
                        : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What drives you\nforward?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Select 3-5 values that define your approach to life. We prioritize meaningful alignment over simple matching.",
              style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildTabs() {
    return SliverAppBar(
      backgroundColor: const Color(0xEE0F0E13),
      pinned: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab("Core Values", isSelected: true),
            _buildTab("Passions"),
            _buildTab("Lifestyle"),
            _buildTab("Future"),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? const Color(0xFFE14D74) : const Color(0x66FFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(height: 4),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFFE14D74),
                shape: BoxShape.circle,
              ),
            )
          ]
        ],
      ),
    );
  }

  SliverPadding _buildGrid() {
    final values = [
      {"icon": Icons.volunteer_activism, "text": "Empathy"},
      {"icon": Icons.psychology, "text": "Growth"},
      {"icon": Icons.explore, "text": "Curiosity"},
      {"icon": Icons.forum, "text": "Debate"},
      {"icon": Icons.palette, "text": "Creation"},
      {"icon": Icons.self_improvement, "text": "Wellness"},
      {"icon": Icons.eco, "text": "Slow Living"},
      {"icon": Icons.hiking, "text": "Adventure"},
    ];

    return SliverPadding(
      padding: const EdgeInsets.all(24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = values[index];
            final isSelected = _selectedValues.contains(item["text"]);
            return _buildGridItem(
              icon: item["icon"] as IconData,
              text: item["text"] as String,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedValues.remove(item["text"]);
                  } else {
                    _selectedValues.add(item["text"] as String);
                  }
                });
              },
            );
          },
          childCount: values.length,
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x15E14D74) : const Color(0xFF18161F),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFFE14D74) : const Color(0x1AFFFFFF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE14D74) : const Color(0x0DFFFFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : const Color(0x66FFFFFF),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE14D74),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 14),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color(0xFF0F0E13),
              const Color(0xFF0F0E13).withOpacity(0),
            ],
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE14D74),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
