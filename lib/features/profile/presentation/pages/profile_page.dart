import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildProfileHeader(),
          const SizedBox(height: 40),
          _buildMenuTile(Icons.shopping_bag_outlined, "My Orders"),
          _buildMenuTile(Icons.person_outline_rounded, "Account Details"),
          _buildMenuTile(Icons.location_on_outlined, "Shipping Address"),
          _buildMenuTile(Icons.payment_rounded, "Payment Methods"),
          _buildMenuTile(Icons.notifications_none_rounded, "Notifications"),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          _buildMenuTile(Icons.help_outline_rounded, "Help Center"),
          _buildMenuTile(Icons.logout_rounded, "Logout", isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF6750A4), width: 2),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF6750A4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Usuario de Ejemplo",
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "carlos.feliz@example.com",
          style: GoogleFonts.outfit(
            fontSize: 14,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTile(IconData icon, String title, {bool isDestructive = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: isDestructive ? Colors.redAccent : Colors.black87),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDestructive ? Colors.redAccent : Colors.black87,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: isDestructive ? Colors.redAccent.withOpacity(0.5) : Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
