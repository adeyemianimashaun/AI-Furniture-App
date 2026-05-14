import 'package:flutter/material.dart';
import 'package:furniture/homepage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Style Your\nSpace. Live\nYour Story.",
      "subtitle":
          "Discover modern furniture that transforms your home into a masterpiece.",
      "image": "lib/images/onb1.jpg",
    },
    {
      "title": "Curated\nCollections\nFor You.",
      "subtitle":
          "Explore handpicked furniture collections for every room and every lifestyle.",
      "image": "lib/images/onb2.jpg",
    },
    {
      "title": "Premium\nComfort.\nTimeless Design.",
      "subtitle":
          "Quality furniture crafted beautifully for comfort, luxury and durability.",
      "image": "lib/images/onb4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),

                        /// TITLE
                        Text(
                          item["title"]!,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Color(0xff123524),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// SUBTITLE
                        SizedBox(
                          width: 280,
                          child: Text(
                            item["subtitle"]!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// MAIN IMAGE SECTION
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              /// YELLOW ARCH BACKGROUND
                              Positioned(
                                right: 10,
                                top: 20,
                                child: Container(
                                  width: 180,
                                  height: 320,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFBC02D),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                      topRight: Radius.circular(100),
                                    ),
                                  ),
                                ),
                              ),

                              /// PRODUCT IMAGE
                              Positioned(
                                bottom: 0,
                                child: Image.asset(
                                  item["image"]!,
                                  height: 360,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              /// DOT INDICATOR
              Row(
                children: List.generate(
                  onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: currentIndex == index ? 18 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? const Color(0xff1B5E20)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// GET STARTED BUTTON
              Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1B5E20),
                      Color(0xff2E7D32),
                    ],
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    if (currentIndex < onboardingData.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),

                        Text(
                          currentIndex == onboardingData.length - 1
                              ? "Get Started"
                              : "Next",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Container(
                          width: 46,
                          height: 46,
                          decoration: const BoxDecoration(
                            color: Color(0xffFBC02D),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}