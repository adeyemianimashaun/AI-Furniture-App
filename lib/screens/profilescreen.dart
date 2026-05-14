import 'package:flutter/material.dart';
import 'package:furniture/authentification/au.dart';
import 'package:furniture/screens/loginsignuppage.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthService _authService = AuthService();

  final List<Map<String, dynamic>> profileOptions = [
    {
      "icon": Icons.inventory_2_outlined,
      "title": "My Orders",
    },
    {
      "icon": Icons.favorite_border,
      "title": "My Wishlist",
    },
    {
      "icon": Icons.location_on_outlined,
      "title": "Addresses",
    },
    {
      "icon": Icons.credit_card_outlined,
      "title": "Payment Methods",
    },
    {
      "icon": Icons.notifications_none_outlined,
      "title": "Notifications",
    },
    {
      "icon": Icons.help_outline,
      "title": "Help & Support",
    },
  ];

  Future<void> handleLogout(BuildContext context) async {
    await _authService.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginSignupPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F2),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F6F2),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            /// PROFILE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff1B5E20),
                    Color(0xff2E7D32),
                  ],
                ),
              ),
              child: Row(
                children: [
                  /// PROFILE IMAGE
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage("lib/images/profile.jpg"),
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// USER INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Deyemi Animashaun",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "animashaundeyemi@gmail.com",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "+48 733 263 389",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            /// MENU OPTIONS
            Expanded(
              child: ListView.builder(
                itemCount: profileOptions.length,
                itemBuilder: (context, index) {
                  final item = profileOptions[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      children: [
                        Icon(
                          item["icon"],
                          color: Colors.black87,
                          size: 24,
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Text(
                            item["title"],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// LOGOUT
            GestureDetector(
              onTap: () => handleLogout(context),
              child: Row(
                children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                  ),

                  SizedBox(width: 12),

                  Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}