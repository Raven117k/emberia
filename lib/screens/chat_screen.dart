import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B0C),
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xB31A1618),
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back, color: Color(0xFF9CA3AF)),
              const Column(
                children: [
                  Text("Elena", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      CircleAvatar(radius: 4, backgroundColor: Colors.green),
                      SizedBox(width: 4),
                      Text("Online", style: TextStyle(color: Colors.green, fontSize: 12)),
                    ],
                  )
                ],
              ),
              const Icon(Icons.more_vert, color: Color(0xFF9CA3AF)),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Connection Depth", style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
                  Text("Level 3", style: TextStyle(color: Color(0xFFD47F9B), fontSize: 10)),
                ],
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: 0.65,
                backgroundColor: const Color(0xFF262023),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD47F9B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTimestamp("Today, 9:41 AM"),
        _buildIncomingMessage(
          "I really liked what you said about intentional travel. Where was the last place you felt truly at peace? ✨",
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCZwjTOsmj4x3GfSZ7zU5zCxDNORX5Hgjt056O8wqN5q8fOLVXwiQg31W8MHpyTIZSiroAOaZOl7NuFCGJH7zYAvdL1FYYQqGXfH3KXTo3rM_e6fQMzz36GbM03fH8ctSaYsJHd1tKN-LodyF54ykUrk5Zdl6wUvoWhDqBV7wlncOXymt363f99wDzXSEpRTiNQ4_uHIaUU2eHipjMOzBdrciFslbtEMn5ra75T2FJDViQW-_FA55b5BIjqK935R7JTdBrcjnTXlXw',
        ),
        _buildOutgoingMessage("That's a deep question. Probably Kyoto, early morning. The silence there feels different."),
        _buildIncomingMessageWithImage(
          "I know exactly what you mean. I took this last year.",
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDtMo1mhbsN-sghdUvDVFN7LmWbuU9ZUeNJf6v7Aj7psdMDEJ6Pmq_1v7_YYK-Zaibiz8Dn8aRIqJTQ-GGDUCdRU3Zblyt0NDH1wMj-Nr8twn8QnKsyOJVYl8lV1w_pJ3s0Wx8R4pcSx4xfzaGra88fJUBZbVdi3XpaOHVCf9VKAfnUJw6wxnWOwLQvwQyDHp9B07Vc14IDZjRPIxEiifn8aNjCJWz82ot-aEtTrw_1tOevwamdgeFU_hlbnKqOTItNx1Li0SMBm9c',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDN8MO1wB0stti3VXBfyuojqKgXN1FgMJ_reknx9smQ2C8j6UKNAn2UQPS3o0Rk_Oaed9qJBhkE7uKzIyCpOPBFRDAosV5CbVeMJ-nDGrE-83tqWIvl8vhve3EDG4UjsigDjz5eQ43-CPFVTiLYDYfA72byV7Q3kcl1IdRZkGB-Xq2dJIu4z3XqrUCEYf2VB9nxs7TTRs7MygAvQc1PBT-1--Rqlt58OXLlEsljHOP1oRRzBq7n1sQl4c1o25NSuH-KjFhqTcZA9Dc',
        ),
      ],
    );
  }

  Widget _buildTimestamp(String time) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0x801A1618),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(time, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 10)),
      ),
    );
  }

  Widget _buildIncomingMessage(String text, String avatarUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1A1C),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutgoingMessage(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFD47F9B),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
              ),
              child: Text(text, style: const TextStyle(color: Color(0xFF0D0B0C))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomingMessageWithImage(String text, String imageUrl, String avatarUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1A1C),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(imageUrl),
                  ),
                  const SizedBox(height: 8),
                  Text(text, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xD90D0B0C),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildSuggestionChip("Ask about photo", Icons.image),
                _buildSuggestionChip("Story suggestion", Icons.auto_awesome),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF1A1618),
                child: Icon(Icons.add, color: Color(0xFFD47F9B)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Message...",
                    hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                    filled: true,
                    fillColor: const Color(0xFF1A1618),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(Icons.sentiment_satisfied, color: Color(0xFF9CA3AF)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const CircleAvatar(
                backgroundColor: Color(0xFFD47F9B),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        avatar: Icon(icon, color: const Color(0xFFD47F9B), size: 16),
        label: Text(label),
        backgroundColor: const Color(0xFF1A1618),
        labelStyle: const TextStyle(color: Color(0xFFF2F0F1), fontSize: 12),
      ),
    );
  }
}
