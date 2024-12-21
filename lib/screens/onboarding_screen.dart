import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'welcome_screen_1.dart';
import 'welcome_screen_2.dart';
import 'welcome_screen_3.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  final List<Widget> pages = [
    WelcomeScreen1(),
    WelcomeScreen2(),
    WelcomeScreen3(),
  ];

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController, // Use the PageController
              itemCount: pages.length,
              onPageChanged: controller.setCurrentPage,
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.all(4),
                    width: controller.currentPage.value == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: controller.skipOnboarding,
                  child: Text('Skip'),
                ),
                Obx(() {
                  return ElevatedButton(
                    onPressed: controller.currentPage.value == pages.length - 1
                        ? controller.skipOnboarding
                        : controller.nextPage,
                    child: Text(controller.currentPage.value == pages.length - 1
                        ? 'Finish'
                        : 'Next'),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
