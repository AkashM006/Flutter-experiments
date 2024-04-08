import 'package:flutter/material.dart';
import 'package:sample/widgets/expandable_page_view.widget.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExpandablePageView(
            controller: pageController,
            children: [
              Column(
                children: [
                  Text(
                    "Screen 1",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.bounceIn),
                    child: const Text("Next"),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Screen 2",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Screen 2 Content"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
