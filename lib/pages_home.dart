import 'package:flutter/material.dart';
import 'package:sample/screens/screen_one.dart';
import 'package:sample/screens/screen_two.dart';

const duration = Duration(milliseconds: 250);
const curve = Curves.easeInOut;

class PagesHome extends StatefulWidget {
  const PagesHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PagesHomeState();
  }
}

class _PagesHomeState extends State<PagesHome> {
  late PageController _pageController;
  int step = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onNext() {
    _pageController.nextPage(
      duration: duration,
      curve: curve,
    );
    setState(() {
      step = 2;
    });
  }

  void onPrev() {
    _pageController.previousPage(
      duration: duration,
      curve: curve,
    );
    setState(() {
      step = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: step == 1,
        onPopInvoked: (didPop) {
          if (didPop) return;
          onPrev();
        },
        child: PageView(
          controller: _pageController,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [
            ScreenOne(onNext: onNext),
            ScreenTwo(onPrev: onPrev),
          ],
        ),
      ),
    );
  }
}
