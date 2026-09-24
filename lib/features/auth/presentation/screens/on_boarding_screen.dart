import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mm_2/core/router/app_router.dart';
import '/core/constant/local_keys.dart';
import '/core/local_storage/base_local_storage.dart';
import 'package:mm_2/features/auth/data//models/on_boarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this._localStorage});

  final BaseLocalStorage _localStorage;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingItem> _pages = const [
    OnboardingItem(
      image: 'Assets2/images/onboarding1.jpeg',
      title: 'Discover Elora',
      description:
      'Elegant accessories designed to make your style unforgettable.',
    ),

    OnboardingItem(
      image: 'Assets2/images/onboarding2.jpeg',
      title: 'Complete Your Look',
      description:
      'Find the perfect piece to add a beautiful touch to every outfit.',
    ),

    OnboardingItem(
      image: 'Assets2/images/onboarding3 new.jpeg',
      title: 'Shine With Elora',
      description:
      'Express your style, embrace your elegance, and shine your way.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  Future<void> _skip() async {
    // _pageController.animateToPage(
    //   _pages.length - 1,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    // );
    await widget._localStorage.setBool(LocalKeys.isOpen, true);
    if (!mounted) return;
    context.goNamed('login');
  }

  Future<void> _finishOnboarding() async {
    await widget._localStorage.setBool(LocalKeys.isOpen, true);

    if (!mounted) return;
    context.goNamed('login');
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: TextButton(
                  onPressed: _currentPage == _pages.length - 1 ? null : _skip,
                  child: const Text('Skip',
                      style: TextStyle(
                      color: Color(0xFF0B1F3A),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
                  ),
                ),
              ),
            ),

            // Pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: Image.asset(page.image, fit: BoxFit.contain),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          page.description,
                          textAlign: TextAlign.center,

                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                final isActive = index == _currentPage;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF0B1F3A)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),

            const SizedBox(height: 32),

            // Next / Get Started
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF0B1F3A),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}