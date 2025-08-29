import 'package:flutter/material.dart';
import 'package:todo_pro/models/onboarding_model.dart';
import 'package:todo_pro/data/data.dart';
import 'package:todo_pro/widgets/onboarding/dot_indicator.dart';
import 'package:todo_pro/widgets/onboarding/navigation_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> onboardingData = getOnboardingData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 220,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.assignment,
                            size: 100,
                            color: Colors.blue.shade700,
                          ),
                        ),
                        const SizedBox(height: 40),

                        Text(
                          onboardingData[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          onboardingData[index].subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //
            DotIndicator(length: onboardingData.length, active: _currentPage),
            const SizedBox(height: 20),

            //
            NavigationButtons(
              length: onboardingData.length,
              active: _currentPage,
              controller: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}
