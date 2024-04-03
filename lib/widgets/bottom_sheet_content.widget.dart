import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  List<Widget> returnBodyWidget() {
    final List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(const Text("Very discrete text"));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight * 0.9,
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
                itemBuilder: (context, index) =>
                    const Text("Very Discrete Text"),
              ),
            ],
          ),
        );
      },
    );
    // return SingleChildScrollView(
    //   controller: scrollController,
    //   padding: const EdgeInsets.all(20),
    //   child: SizedBox(
    //     width: double.infinity,
    //     child: Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    // Text(
    //   "Sheet Heading",
    //   style: Theme.of(context).textTheme.headlineLarge,
    // ),
    //           const SizedBox(
    //             height: 50,
    //           ),
    //           ListView.builder(
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) =>
    //                 const Text("Very discrete Text"),
    //             itemCount: 100,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    // },
    // );
  }
}
