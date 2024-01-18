import 'package:flutter/material.dart';
import 'package:todo_apps/ui/screen/welcome_page.dart';

class SimpleOnboardingPage extends StatefulWidget {
  const SimpleOnboardingPage({Key? key}) : super(key: key);

  @override
  State<SimpleOnboardingPage> createState() => _SimpleOnboardingPageState();
}

class _SimpleOnboardingPageState extends State<SimpleOnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleWelcomePage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/clipboard.png',
                          height: 200,
                        ),
                        SizedBox(height: 20),
                        Text(
                          _getPageTitle(index),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _getPageContent(index),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white38,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == i
                                ? Colors.white
                                : Colors.white38,
                          ),
                        ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Welcome to TaskZen!';
      case 1:
        return 'Quick Setup';
      case 2:
        return 'Start Tasking!';
      default:
        return '';
    }
  }

  String _getPageContent(int index) {
    switch (index) {
      case 0:
        return "Let's streamline your tasks for a more efficient and organized life.";
      case 1:
        return 'Personalize your tasks with just a few clicks. Set priorities, create categories, and tailor reminders to suit your needs.';
      case 2:
        return "You're all set! Start adding tasks, set deadlines, and let TaskZen handle the rest. Welcome to a more organized and stress-free life!";
      default:
        return '';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SimpleOnboardingPage(),
  ));
}
