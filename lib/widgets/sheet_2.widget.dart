import 'package:flutter/material.dart';

class Sheet2 extends StatelessWidget {
  const Sheet2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "Sheet Heading",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) => const Text("Very Discrete Text"),
          ),
        ],
      ),
    );
  }
}
